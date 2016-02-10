#!/usr/bin/python2.7
"""
Python (multiagent)PDDL Parser - ppp.py - version 1.0.0 public version
Written by Matthew Crosby 2014
Parses multiagent PDDL domain and problem files with concurrency constraints.
Outputs a temporal domain and problem file to out and outp

GNU GPL LICENSE information:
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

Details of the encoding can be found in the paper:
Temporal Multiagent Plannning with Concurrent Action constraints
found at http://homepages.inf.ed.ac.uk/mcrosby1/
Comments/bugs/suggestions should be sent to m.crosby @ ed.ac.uk

Note: this version is a draft functional version while the code is being refactored.
  currently misssing the ability to translate conjunctive concurrency constraints. 
  this version only tested on a small set of domains.

As a short summary:
domain files must use the sole requirement - "typing"
domain files must conatin an agent type and all agents are of type "agent"
actions may have a defined duration by 
  :duration <int>
otherwise they are assumed to have duration 1
concurrencies must be defined for every object of a type (with the same action list)
  this is not checked for
action lists cannot overlap

problem files may have an additional -capabilities- and -concurrencies- defn.
(:capabilities
  (agent_name action_names...)
  ...
)
(:concurrencies
  (obj_name action_names... min max)
  ...
)
Some conjunctive concurency constraints are also permitted (see paper)

==========================================

ALD
TODO:
* update the write_temp_problem function to add (free {}) for multiple agent types
  def write_temp_problem(self, output_file):
    ...
    for agent in self.objects.get("agent"):
      to_write += "\t(free {})\n".format(agent)
"""
import sys
from sets import Set

DFILE_KEYWORDS = ["requirements", "types", "predicates", "action"]
DFILE_REQ_KEYWORDS = ["typing"]
DFILE_SUBKEYWORDS = ["parameters", "precondition", "effect", "duration"]
PFILE_KEYWORDS = ["objects", "concurrencies", "capabilities", "init", "goal"]

class Predicate(object):
  """A loose interpretation of a predicate used for all similar collections.

  Without a name it is a parameter list.
  It can be typed (or not).
    If typed then args = [[var, type], ...]
    Else args = [var, ...]
  It can be negated.
  It may contain variables or objects in its arguments.
  """
  def __init__(self, name, args, is_typed, is_negated):
    self.name = name
    self.args = args
    self.arity = len(args)
    self.is_typed = is_typed
    self.is_negated = is_negated

  def pddl_rep(self):
    """Returns the PDDL version of the instance."""
    rep = ''
    if self.is_negated:
      rep += "(not "
    if self.name != "":
      rep += "(" + self.name + " "
    else:
      rep += "("
    for argument in self.args:
      if self.is_typed:
        rep += argument[0] + " - " + argument[1] + " "
      else:
        rep += argument + " "
    rep = rep[:-1]
    rep += ")"
    if self.is_negated:
      rep += ")"
    return rep

  def __repr__(self):
    return self.pddl_rep()

class Concurrency(object):
  """Represents a concurrency constraint (or conjunction of constraints)."""

  def __init__(self, predicate_array):
    self.is_conjunction = False
    if len(predicate_array) > 1:
      self.is_conjunction = True
    self.concurrency_array = []
    for predicate in predicate_array:
      self.concurrency_array.append(singleConcurrency(predicate.name,
                                                      predicate.args[:-2],
                                                      predicate.args[-2:-1][0],
                                                      predicate.args[-1:][0]))
    self.is_optimisable_one_one = False
    if not self.is_conjunction:
      if self.concurrency_array[0].min_ == '1' and self.concurrency_array[0].max_ == '1':
        self.is_optimisable_one_one = True
    self.is_optimisable_two_two = False
    if not self.is_conjunction:
      if self.concurrency_array[0].min_ == '2' and self.concurrency_array[0].max_ == '2':
        self.is_optimisable_two_two = True

  def get_init_functions(self, object_list):
    """Returns array containing the pddl rep of the functions
    created from the concurrency constraints."""
    init_func_array = []
    if not self.is_conjunction:
      obj = self.concurrency_array[0].object_
      type_ = self.get_type(object_list)
      act_list = self.get_action_list()
      init_func_array.append("(= (using-{}-{} {}) 0)"
                             .format(type_, act_list, obj))
      init_func_array.append("(= (min-{}-{} {}) {})"
                             .format(type_, act_list, obj,
                                     self.concurrency_array[0].min_))
      init_func_array.append("(= (max-{}-{} {}) {})"
                             .format(type_, act_list, obj,
                                     self.concurrency_array[0].max_))
    else:
      print "Conjunctive concurrencies not dealt with yet."
      sys.exit()
    return init_func_array

  def get_type(self, object_list):
    if not self.is_conjunction:
      obj = self.concurrency_array[0].object_
      for type_, obj_ in object_list.iteritems():
        if obj in obj_:
          return type_
    else:
      print "Conjuntive concurrencies not dealt with yet."
      sys.exit()
    print "Type not found"
    sys.exit()

  def get_object(self):
    if not self.is_conjunction:
      return self.concurrency_array[0].object_
    else:
      print "Conjuntive concurrencies not dealt with yet."
      sys.exit()
    print "Type not found"
    sys.exit()

  def get_separate_action_list(self):
    if not self.is_conjunction:
      return self.concurrency_array[0].action_list
    else:
      print "Conjuntive concurrencies not dealt with yet."
      sys.exit()
    print "action list not found"
    sys.exit()

  def get_action_list(self):
    if not self.is_conjunction:
      obj = self.concurrency_array[0].action_list
      string = ""
      for action in obj:
        string += action + "-"
      string = string[:-1]
      return string
    else:
      print "Conjuntive concurrencies not dealt with yet."
      sys.exit()
    print "action list not found"
    sys.exit()

  def get_affordance(self, object_list):
    return "{}-{}".format(self.get_type(object_list), self.get_action_list())

  def pddl_rep(self):
    """Returns the PDDL version of the instance"""
    string = ""
    if self.is_conjunction:
      string += "(and "
    for concurrency in self.concurrency_array:
      string += concurrency.pddl_rep()
    if self.is_conjunction:
      string += ")"
    return string

  def __repr__(self):
    return self.pddl_rep()


class singleConcurrency(object):
  def __init__(self, object_, action_list, min_, max_):
    self.object_ = object_
    self.action_list = action_list
    self.min_ = min_
    self.max_ = max_
    obj_act_cat = object_.join(action_list)

  def pddl_rep(self):
    string = "("
    string += self.object_ + " "
    for action in self.action_list:
      string += action + " "
    string += self.min_ + " " + self.max_ + ")"
    return string


class Action(object):
  """Represents a simple non-temporal action."""
  def __init__(self, name, parameters, precondition, effect):
    self.name = name
    self.parameters = parameters
    self.precondition = precondition
    self.effect = effect
    self.duration = 1
    self.is_in_all_capabilities = False
    self.is_in_a_capability = False
    self.affordance = ''
    self.is_optimisable_one_one = False
    self.is_optimisable_two_two = False
    self.has_constraint = False

  def get_agents_in_params(self):
    agent_vars = []
    for arg in self.parameters.args:
      if arg[1] == 'agent':
        agent_vars.append(arg[0])
    return agent_vars

  def pddl_rep(self):
    """Returns the PDDL version of the instance."""
    rep = ''
    rep += "(:action " + self.name + "\n"
    rep += "\t:parameters " + str(self.parameters) + "\n"
    rep += "\t:precondition (and\n"
    for precon in self.precondition:
      rep += "\t\t" + str(precon) + "\n"
    rep += "\t)\n"
    rep += "\t:effect (and\n"
    for eff in self.effect:
      rep += "\t\t" + str(eff) + "\n"
    rep += "\t)\n"
    rep += ")\n"
    return rep

  def temp_pddl_rep_start(self):
    """Returns the temporal PDDL version of the instance."""
    rep = ''
    rep += "(:durative-action {}-start\n".format(self.name)
    rep += "\t:parameters {}\n".format(self.parameters)
    rep += "\t:duration (= ?duration 1)\n"
    rep += "\t:condition\n"
    rep += "\t\t(and\n"
    for precondition in self.precondition:
      rep += "\t\t\t(at start {})\n".format(precondition)
    rep += "\t\t)\n"
    rep += "\t:effect\n"
    rep += "\t\t(and\n"
    for effect in self.effect:
      if effect.is_negated:
        rep += "\t\t\t(at start {})\n".format(effect)
      else:
        rep += "\t\t\t(at end {})\n".format(effect)

    rep += "\t\t)\n"
    rep += ")\n"
    return rep

  def __repr__(self):
    return self.name + str(self.parameters)


class PlanningProblem(object):
  """A complete planning problem."""
  def __init__(self, domainfile, problemfile):
    #From domainfile
    self.domain = '' #String
    self.requirements = [] #[String]
    self.type_list = Set() #{String}
    self.type_list.add('object')
    self.types = {} #Key = supertype_name, Value = type
    self.predicates = [] #[Predicate]
    self.actions = [] #[Action]
    #From problemfile
    self.problem = '' #String
    self.object_list = Set() #{String}
    self.objects = {} #Key = type, Value = object_name
    self.concurrencies = [] #A list of (conjunctive lists) of predicates
    self.capabilities = {} #Key:agent, #Value:possible action
    self.affordances = {} #Key:affordancename #Value:concurrency
    self.init = [] #List of Predicates
    self.goal = [] #List of Predicates

    self.constrained_types = Set()
    self.optimised_one_one_types = Set()
    self.optimised_two_two_types = Set()
    self.optimised_one_one_actions = Set()
    self.optimised_two_two_actions = Set()

    self.parse_domain(domainfile)
    self.parse_problem(problemfile)

    for action in self.actions:
      is_in_all_capabilities = True
      is_in_a_capability = False
      for agent in self.capabilities:
        if action.name not in self.capabilities.get(agent):
          is_in_all_capabilities = False
        else:
          is_in_a_capability = True
      if is_in_all_capabilities:
        action.is_in_all_capabilities = True
      if is_in_a_capability:
        action.is_in_a_capability = True

    for concurrency in self.concurrencies:
      self.affordances.setdefault(concurrency.get_affordance(self.objects), []).append(concurrency)
    
    for affordance in self.affordances:
      t = self.affordances.get(affordance)[0].get_type(self.objects)
      self.constrained_types.add(t)
      at_least_one_optimisable = False
      all_optimisable_one_one = True
      for concurrency in self.affordances.get(affordance):
        if concurrency.is_optimisable_one_one:
          at_least_one_optimisable = True
        else:
          all_optimisable_one_one = False
      if all_optimisable_one_one and at_least_one_optimisable:
        self.optimised_one_one_types.add(t)
        for act in self.get_action_list_from_affordance(affordance):
          self.optimised_one_one_actions.add(act)

    for affordance in self.affordances:
      at_least_one_optimisable = False
      all_optimisable_one_one = True
      for concurrency in self.affordances.get(affordance):
        if concurrency.is_optimisable_two_two:
          at_least_one_optimisable = True
        else:
          all_optimisable_one_one = False
      if all_optimisable_one_one and at_least_one_optimisable:
        t = self.affordances.get(affordance)[0].get_type(self.objects)
        self.optimised_two_two_types.add(t)
        for act in self.get_action_list_from_affordance(affordance):
          self.optimised_two_two_actions.add(act)

    #Match each action to at most a single affordance (this must be possible)
    for action in self.actions:
      for affordance in self.affordances:
        act_list = self.affordances.get(affordance)[0].get_separate_action_list()
        if action.name in act_list:
          if action.affordance == '':
            action.affordance = affordance
          else:
            "Error action had two different affordances"
            sys.exit()

    for action in self.actions:
      if action.name in self.optimised_two_two_actions:
        action.is_optimisable_two_two = True
      if action.name in self.optimised_one_one_actions:
        action.is_optimisable_one_one = True

    for action in self.actions:
     for param in action.parameters.args:
        if param[1] in self.constrained_types:
          action.has_constraint = True

    self.check_valid()
    self.print_problem()

  def print_problem(self):
    """Prints out the planning problem in (semi-)readable format."""
    print '\n*****************'
    print 'DOMAIN: ' + self.domain
    print 'PROBLEM: ' + self.problem
    print 'REQUIREMENTS: ' + str(self.requirements)
    print 'TYPES: ' + str(self.types)
    print 'PREDICATES: ' + str(self.predicates)
    print 'ACTIONS: ' + str(self.actions)
    print 'OBJECTS: ' + str(self.objects)
    print 'CONCURRENCIES: ' + str(self.concurrencies)
    print 'AFFORDANCES: ' + str(self.affordances)
    print 'CAPABILITIES: ' + str(self.capabilities)
    print 'INIT: ' + str(self.init)
    print 'GOAL: ' + str(self.goal)
    print '****************'

  def get_action_list_from_affordance(self, affordance):
    return affordance.split('-')[1:]

  def check_valid(self):
    for act in self.actions:
      if act.name.startswith("can-"):
        print "PDDL Error:"
        print "cannot have action name beginning with can-"
        sys.exit()
    if not "agent" in self.type_list:
      print "PDDL Error:"
      print "no agent type found"
      sys.exit()

  def parse_domain(self, domainfile):
    """Parses a PDDL domain file."""
    
    with open(domainfile) as dfile:
      dfile_array = self._get_file_as_array(dfile)
    #Deal with front/end define, problem, :domain
    if dfile_array[0:4] != ['(', 'define', '(', 'domain']:
      print 'PARSING ERROR: Expected (define (domain ... at start of domain file'
      sys.exit()
    self.domain = dfile_array[4]

    dfile_array = dfile_array[6:-1]
    opencounter = 0
    keyword = ''
    obj_list = []
    is_obj_list = True
    for word in dfile_array:
      if word == '(':
        opencounter += 1
      elif word == ')':
        opencounter -= 1
      elif word.startswith(':'):
        if word[1:] not in DFILE_KEYWORDS:
          pass
        elif keyword != 'requirements':
          keyword = word[1:]
      if opencounter == 0:
        if keyword == 'action':
          self.actions.append(obj_list)
          obj_list = []
        if keyword == 'types':
          for element in obj_list:
            self.types.setdefault('object', []).append(element)
            self.type_list.add('object')
            self.type_list.add(element)
          obj_list = []
        keyword = ''

      if keyword == 'requirements': #Requirements list
        if word != ':requirements':
          if not word.startswith(':'):
            print 'PARSING ERROR: Expected requirement to start with :'
            sys.exit()
          elif word[1:] not in DFILE_REQ_KEYWORDS:
            print 'PARSING ERROR: Unknown Rquierement ' + word[1:]
            print 'Requirements must only be: ' + str(DFILE_REQ_KEYWORDS)
            sys.exit()
          else:
            self.requirements.append(word[1:])
      elif keyword == 'action':
        obj_list.append(word)
      elif not word.startswith(':'):
        if keyword == 'types': #Typed list of objects
          if is_obj_list:
            if word == '-':
              is_obj_list = False
            else:
              obj_list.append(word)
          else:
            #word is type
            for element in obj_list:
              if not word in self.type_list:
                self.types.setdefault('object', []).append(word)
                self.type_list.add(word)
              self.types.setdefault(word, []).append(element)
              self.type_list.add(element)
              self.type_list.add(word)
            is_obj_list = True
            obj_list = []
        elif keyword == 'predicates': #Internally typed predicates
          if word == ')':
            p_name = obj_list[0]
            pred_list = self._parse_name_type_pairs(obj_list[1:],
                                                    self.type_list)
            self.predicates.append(Predicate(p_name, pred_list, True, False))
            obj_list = []
          elif word != '(':
            obj_list.append(word)

    #Work on the actions
    new_actions = []
    for action in self.actions:
      act_name = action[1]
      act = {}
      action = action[2:]
      keyword = ''
      for word in action:
        if word.startswith(':'):
          keyword = word[1:]
        else:
          act.setdefault(keyword, []).append(word)
      param_list = self._parse_name_type_pairs(act.get('parameters')[1:-1],
                                               self.type_list)
      up_params = Predicate('', param_list, True, False)
      pre_list = self._parse_unground_propositions(act.get('precondition'))
      eff_list = self._parse_unground_propositions(act.get('effect'))
      new_act = Action(act_name, up_params, pre_list, eff_list)
      if(act.get('duration')):
        new_act.duration = act.get('duration')[0]
      new_actions.append(new_act)
    self.actions = new_actions


  def parse_problem(self, problemfile):
    """The main method for parsing a PDDL files."""

    with open(problemfile) as pfile:
      pfile_array = self._get_file_as_array(pfile)
    #Deal with front/end define, problem, :domain
    if pfile_array[0:4] != ['(', 'define', '(', 'problem']:
      print 'PARSING ERROR: Expected (define (problem ... at start of problem file'
      sys.exit()
    self.problem = pfile_array[4]
    if pfile_array[5:8] != [')', '(', ':domain']:
      print 'PARSING ERROR: Expected (:domain ...) after (define (problem ...)'
      sys.exit()
    if self.domain != pfile_array[8]:
      print 'ERROR - names don\'t match between domain and problem file.'
      sys.exit()
    if pfile_array[9] != ')':
      print 'PARSING ERROR: Expected end of domain declaration'
      sys.exit()
    pfile_array = pfile_array[10:-1]

    opencounter = 0
    keyword = ''
    is_obj_list = True
    obj_list = []
    int_obj_list = []
    int_opencounter = 0
    for word in pfile_array:
      if word == '(':
        opencounter += 1
      elif word == ')':
        opencounter -= 1
      elif word.startswith(':'):
        if word[1:] not in PFILE_KEYWORDS:
          print 'PARSING ERROR: Unknown keyword: ' + word[1:]
          print 'Known keywords: ' + str(PFILE_KEYWORDS)
        else:
          keyword = word[1:]
      if opencounter == 0:
        keyword = ''

      if not word.startswith(':'):
        if keyword == 'objects': #Typed list of objects
          if is_obj_list:
            if word == '-':
              is_obj_list = False
            else:
              obj_list.append(word)
          else:
            #word is type
            for element in obj_list:
              if word in self.type_list:
                self.objects.setdefault(word, []).append(element)
                self.object_list.add(element)
              else:
                print self.type_list
                print "ERROR unknown type " + word
                sys.exit()
            is_obj_list = True
            obj_list = []
        elif keyword == 'capabilities' or keyword == 'init':
          if word == ')':
            if keyword == 'capabilities':
              for word in obj_list[1:]:
                self.capabilities.setdefault(obj_list[0], []).append(word)
            elif keyword == 'init':
              self.init.append(Predicate(obj_list[0], obj_list[1:],
                               False, False))
            obj_list = []
          elif word != '(':
            obj_list.append(word)
        elif keyword == 'concurrencies' or keyword == 'goal':
          if word == '(':
            int_opencounter += 1
          elif word == ')':
            int_opencounter -= 1
          obj_list.append(word)
          if int_opencounter == 0:
            if keyword == 'concurrencies':
              if obj_list[0:3] == ['(', 'and', '(']:
                self.concurrencies.append(Concurrency(self._parse_unground_propositions(obj_list)))
              else:
                self.concurrencies.append(Concurrency([self._parse_unground_proposition(obj_list)]))
            elif keyword == 'goal':
              self.goal = self._parse_unground_propositions(obj_list)
            obj_list = []
    #Standardise the capabilities
    actions_in_capabilities = Set()
    for agent_name, action_list in self.capabilities.iteritems():
      for act in action_list:
        actions_in_capabilities.add(act)
    for act in self.actions:
      if not act.name in actions_in_capabilities:
        for capability in self.capabilities:
          self.capabilities.get(capability).append(act.name)

  def write_temp_domain(self, output_file):
    """Writes a temporal domain file for this planning problem."""
    file_ = open(output_file, 'w')
    to_write = "(define (domain " + self.domain + ")\n"
    #Requirements
    equality_required = False
    for concurrency in self.concurrencies:
      if concurrency.is_optimisable_two_two:
        equality_required = True
    if equality_required:
      to_write += "\t(:requirements :equality :fluents :durative-actions :typing)\n"
    else:
      to_write += "\t(:requirements :fluents :durative-actions :typing)\n"
    #Types
    to_write += "(:types\n"
    for type_ in self.types:
      to_write += "\t"
      for key in self.types.get(type_):
        to_write += key + " "
      to_write += "- " + type_
      to_write += "\n"
    to_write += ")\n"
    #Predicates
    to_write += "(:predicates\n"
    for predicate in self.predicates:
      to_write += "\t{}\n".format(predicate.pddl_rep())
    to_write += "\t(free ?a - agent)\n"
    for t in self.optimised_one_one_types:
      to_write += "\t(free-{} ?{} - {})\n".format(t, t[0], t)
    for action in self.actions:
        if action.is_in_a_capability and not action.is_in_all_capabilities:
          to_write += "\t(can-{} ?a - agent)\n".format(action.name)
    to_write += ")\n"
    #Functions
    to_write += "(:functions\n"
    used_affordances = Set()
    for concurrency in self.concurrencies:
      if not concurrency.is_optimisable_one_one and not concurrency.is_optimisable_two_two:
        conc_type = concurrency.get_type(self.objects)
        conc_actions = concurrency.get_action_list()
        if not "{}-{}".format(conc_type, conc_actions) in used_affordances:
          to_write += "\t(using-{}-{} ?o - {})\n".format(conc_type, conc_actions, conc_type)
          to_write += "\t(min-{}-{} ?o - {})\n".format(conc_type, conc_actions, conc_type)
          to_write += "\t(max-{}-{} ?o - {})\n".format(conc_type, conc_actions, conc_type)
        used_affordances.add("{}-{}".format(conc_type, conc_actions))
    to_write += ")\n"
    #Actions
    for action in self.actions:
      if action.is_optimisable_two_two or action.is_optimisable_one_one or not action.has_constraint:
        to_write += "(:durative-action {}\n".format(action.name)
      else:
        to_write += "(:durative-action {}-start\n".format(action.name)
      if action.is_optimisable_two_two:
        normparams = "\t:parameters {}\n".format(action.parameters)
        arr = normparams.split()
        i = arr.index("agent")
        arr.insert(i+1, "?a2 - agent")
        to_write += ' '.join(arr)
        to_write += '\n'
      else:
        to_write += "\t:parameters {}\n".format(action.parameters)
      to_write += "\t:duration (= ?duration {})\n".format(action.duration)
      to_write += "\t:condition\n\t\t(and\n"
      if action.is_optimisable_two_two:
        to_write += "\t\t\t(at start (not (= ?a ?a2)))\n"
      for condition in action.precondition:
        to_write += "\t\t\t(at start {})\n".format(condition)
        if action.is_optimisable_two_two and '?a' in condition.args:
          to_write += "\t\t\t(at start {})\n".format(condition).replace('?a', '?a2')
      if action.is_in_a_capability and not action.is_in_all_capabilities:
        to_write += "\t\t\t(at start (can-{} ?a))\n".format(action.name)
      for agent in action.get_agents_in_params():
        to_write += "\t\t\t(at start (free {}))\n".format(agent)
        if action.is_optimisable_two_two:
          to_write += "\t\t\t(at start (free {}2))\n".format(agent)
      for param in action.parameters.args:
        if param[1] in self.optimised_one_one_types and action.is_optimisable_one_one:
          to_write += "\t\t\t(at start (free-{} ?{}))\n".format(param[1], param[1][0])
      #Add function updates based on concurrencies...
      to_write += "\t\t)\n"
      to_write += "\t:effect\n\t\t(and\n"
      for effect in action.effect:
        if effect.is_negated:
          to_write += "\t\t\t(at start {})\n".format(effect)
        else:
          to_write += "\t\t\t(at end {})\n".format(effect)
      for agent in action.get_agents_in_params():
        to_write += "\t\t\t(at start (not (free {})))\n".format(agent)
        to_write += "\t\t\t(at end (free {}))\n".format(agent)
        if action.is_optimisable_two_two:
          to_write += "\t\t\t(at start (not (free {}2)))\n".format(agent)
          to_write += "\t\t\t(at end (free {}2))\n".format(agent)
      for param in action.parameters.args:
        #TODO this should probably check that the parameter and action share a concurrency
        # as otherwise may cause problem if action has multiple one-one optimisable params
        if param[1] in self.optimised_one_one_types and action.is_optimisable_one_one:
          to_write += "\t\t\t(at start (not (free-{} ?{})))\n".format(param[1], param[1][0])
          to_write += "\t\t\t(at end (free-{} ?{}))\n".format(param[1], param[1][0])
      to_write += "\t\t)\n"
      to_write += ")\n"
      #Join action
      #Not required if 1 for 1 optimised
      if action.has_constraint and not action.is_optimisable_one_one and not action.is_optimisable_two_two:
        to_write += "(:durative-action {}-join\n".format(action.name)
        to_write += "\t:parameters {}\n".format(action.parameters)
        to_write += "\t:duration (= ?duration {})\n".format(action.duration)
        to_write += "\t:condition\n\t\t(and\n"
        for condition in action.precondition:
          to_write += "\t\t\t(at start {})\n".format(condition)
        to_write += "\t\t\t(at start (can-{} ?a))\n".format(action.name)
        for agent in action.get_agents_in_params():
          to_write += "\t\t\t(at start (free {}))\n".format(agent)
        to_write += "\t\t)\n"
        to_write += "\t:effect\n\t\t(and\n"
        for effect in action.effect:
          if effect.is_negated:
            to_write += "\t\t\t(at start {})\n".format(effect)
          else:
            to_write += "\t\t\t(at end {})\n".format(effect)
        for agent in action.get_agents_in_params():
          to_write += "\t\t\t(at start (not (free {})))\n".format(agent)
          to_write += "\t\t\t(at end (free {}))\n".format(agent)
        to_write += "\t\t)\n"
        to_write += ")\n"

    #Endmatter
    to_write += ")" #Close domain defn
    file_.write(to_write)
    file_.close()

  def write_temp_problem(self, output_file):
    file_ = open(output_file, 'w')
    to_write = "(define (problem " + self.problem +") "
    to_write += "(:domain " + self.domain + ")\n"
    #Objects
    to_write += "(:objects\n"
    for object_type in self.objects:
      to_write += "\t"
      for object_name in self.objects.get(object_type):
        to_write += object_name  + " "
      to_write += "- " + object_type + "\n"
    to_write += ")\n"
    to_write += "(:init\n"
    for predicate in self.init:
      to_write += "\t{}\n".format(predicate)
    for obj_type in self.types.get("agent"):
      if obj_type is not None and self.objects.get(obj_type) is not None:
        for agent in self.objects.get(obj_type):
          to_write += "\t(free {})\n".format(agent)
#    for agent in self.objects.get("agent"):
#      to_write += "\t(free {})\n".format(agent)
    for agent in self.capabilities:
      for action in self.capabilities.get(agent):
        for act in self.actions:
          if act.name == action:
            if act.is_in_a_capability and not act.is_in_all_capabilities:
              to_write += "\t(can-{} {})\n".format(action, agent)
    for t in self.optimised_one_one_types:
      for obj in self.objects.get(t):
        to_write += "\t(free-{} {})\n".format(t, obj)
    for concurrency in self.concurrencies:
      if not concurrency.is_optimisable_one_one and not concurrency.is_optimisable_two_two:
        for init_func in concurrency.get_init_functions(self.objects):
          to_write += "\t{}\n".format(init_func)
    to_write += ")\n"
    to_write += "(:goal\n\t(and\n"
    for goal in self.goal:
      to_write += "\t\t{}\n".format(goal)
    to_write += "\t)\n)\n"
    to_write += "(:metric minimize (total-time))\n"
    #Endmatter
    to_write += ")"
    file_.write(to_write)
    file_.close()

  #Get string of file with comments removed - comments are rest of line after ';'
  def _get_file_as_array(self, file_):
    """Returns the file split into array of words.

    Removes comments and separates parenthesis.
    """
    file_as_string = ""
    for line in file_:
      if ";" in line:
        line = line[:line.find(";")]
      line = (line.replace('\t', '').replace('\n', ' ')
          .replace('(', ' ( ').replace(')', ' ) '))
      file_as_string += line
    file_.close()
    return file_as_string.strip().split()

  def _parse_name_type_pairs(self, array, types):
    """Parses array creating paris of form (name, type).

    Expects array such as [?a, -, agent, ...]."""
    pred_list = []
    if len(array)%3 != 0:
      print "Expected predicate to be typed " + str(array)
      sys.exit()
    for i in range(0, len(array)/3):
      if array[3*i+1] != '-':
        print "Expected predicate to be typed"
        sys.exit()
      if array[3*i+2] in types:
        pred_list.append((array[3*i], array[3*i+2]))
      else:
        print "PARSING ERROR {} not in types list".format(array[3*i+2])
        print "Types list: {}".format(self.type_list)
        sys.exit()
    return pred_list

  def _parse_unground_proposition(self, array):
    """Parses a variable proposition returning dict."""
    negative = False
    if array[1] == 'not':
      negative = True
      array = array[2:-1]
    return Predicate(array[1], array[2:-1], False, negative)

  def _parse_unground_propositions(self, array):
    """Parses possibly conjunctive list of unground propositions.

    Expects array such as [(and, (, at, ?a, ?x, ), ...].
    """
    prop_list = []
    if array[0:3] != ['(', 'and', '(']:
      print 'Array not as expected %s' % array
      sys.exit()
    array = array[2:-1]
    #Split array into blocks
    opencounter = 0
    prop = []
    for word in array:
      if word == '(':
        opencounter += 1
      if word == ')':
        opencounter -= 1
      prop.append(word)
      if opencounter == 0:
        prop_list.append(self._parse_unground_proposition(prop))
        prop = []
    #print array[:array.index(')') + 1]
    return prop_list


if __name__ == "__main__":
  if len(sys.argv) < 3:
    print 'Requires 2 args'
    print 'arg1: domain file'
    print 'arg2: problem file'
    print 'optionally arg3 = output domain file name, arg4 = output problem file name'
    print 'default is out and outp'
  else:
    output_domain = 'out'
    output_problem = 'outp'
    if len(sys.argv) == 5:
      output_domain = sys.argv[3]
      output_problem = sys.argv[4]
    pp = PlanningProblem(sys.argv[1], sys.argv[2])
    pp.write_temp_domain(output_domain)
    pp.write_temp_problem(output_problem)

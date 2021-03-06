# testing error handlers and async execution
# when these are used
#
import NGinnBPM.ProcessModel

variable "V0", "string":
    default_value Environment.MachineName
    options {dir: input, required:true}
        
start_place "start"
end_place "end"

task "T1", "debug":
    init_task:
        Task.Delay = false
        Task.DoFail = false
        
task "T2", "debug":
    init_task:
        Task.Delay = true
        Task.DoFail = false
        log.Warn("T2 - OK")

flow "start", "T2"
flow "start", "T1"
flow "T1", "end"
flow "T2", "end"

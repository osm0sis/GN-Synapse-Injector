cat << CTAG
{
  name:I/O,
  elements:[
    { SPane:{
        title:"Block Queue",
        description:"Set the internal storage block device I/O parameters."
    }},
    { SSeekBar:{
        title:"Read-Ahead Buffer",
        description:"Maximum amount to read-ahead for filesystems on the internal storage.",
        min:128, max:4096, step:128, unit:" kB",
        default:`cat /sys/block/mmcblk0/queue/read_ahead_kb`,
        action:"block read_ahead_kb"
    }},
    { SSeekBar:{
        title:"NR Requests",
        description:"Maximum number of read (or write) requests that can be queued to the scheduler in the block layer.",
        min:128, max:2048, step:128,
        default:`cat /sys/block/mmcblk0/queue/nr_requests`,
        action:"block nr_requests"
    }},
    { SSeekBar:{
        title:"RQ Affinity",
        description:"Try to have scheduler requests complete on the CPU core they were made from. Higher is more aggressive. Some kernels only support 0-1.",
        default:`cat /sys/block/mmcblk0/queue/rq_affinity`,
        action:"block rq_affinity",
        values:{ 0:"0: Disabled", 1:"1", 2:"2" }
    }},
    { SSeekBar:{
        title:"No Merges",
        description:"Types of merges (prioritization) the scheduler queue for this storage device allows.",
        default:`cat /sys/block/mmcblk0/queue/nomerges`,
        action:"block nomerges",
        values:{ 0:"0: All", 1:"1: Simple Only", 2:"2: None" }
    }},
    { SCheckBox:{
        label:"Add Random",
        description:"Draw entropy from spinning (rotational) storage.",
        default:`cat /sys/block/mmcblk0/queue/add_random`,
        action:"block add_random"
    }},
    { SCheckBox:{
        label:"I/O Stats",
        description:"Maintain I/O statistics for this storage device. Disabling will break I/O monitoring apps.",
        default:`cat /sys/block/mmcblk0/queue/iostats`,
        action:"block iostats"
    }},
    { SCheckBox:{
        label:"Rotational",
        description:"Treat device as rotational storage.",
        default:`cat /sys/block/mmcblk0/queue/rotational`,
        action:"block rotational"
    }}
  ]
}
CTAG

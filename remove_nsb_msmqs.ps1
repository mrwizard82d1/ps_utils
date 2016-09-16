[Reflection.Assembly]::LoadWithPartialName("System.Messaging")

[System.Messaging.MessageQueue]::GetPrivateQueuesByMachine("LOCALHOST") | % {".\" + $_.QueueName} | ? {$_ -notmatch "error|audit"} | % {[System.Messaging.MessageQueue]::Delete($_); }

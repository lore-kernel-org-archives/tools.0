Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.16742.1599147158552923120
 for <tools@linux.kernel.org>;
 Thu, 03 Sep 2020 08:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toxicpanda-com.20150623.gappssmtp.com header.s=20150623 header.b=KdpicxVA;
 spf=none, err=permanent DNS error (domain: toxicpanda.com, ip: 209.85.222.182, mailfrom: josef@toxicpanda.com)
Received: by mail-qk1-f182.google.com with SMTP id q5so1206645qkc.2
        for <tools@linux.kernel.org>; Thu, 03 Sep 2020 08:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda-com.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=nio1Z0dUk20rT3Hty53fOp/oCOnwb1HRr6KAqf3TxNY=;
        b=KdpicxVA8uKQNsORvHZHCS0MwUa3+G/T6NIDsDztH5WgMZTlfPe5hc96oUln6+3iW9
         4BZ1GedFdtDym9Yi9htGr9k4IJOqCL2FQlhqWvKigR5oXr+ka/iS6ulJ5OoprzbghFjW
         5kbvi/QzXmPAaaCJT2qdSHa+k2gulumsGYFCmj3y3oYKsd62Zz1TVzOSolL9Bj7ovfCf
         TmpC1cHggprSXBV3IqYqJwQV8lLE6DMfaz8JzcLZ6vUOBreFFNyw/eW8r7GYcgmXyAHn
         0vLKsGEcfkEb3jZ05nw/D9SZK5gS8zLCzmAHtUFieWcER4HQxoUDtMxYGuSp6ifzA7Sj
         ovCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=nio1Z0dUk20rT3Hty53fOp/oCOnwb1HRr6KAqf3TxNY=;
        b=OCUjbb31o17H2bT3VEYFis6tr4D0P5zPsjgm3/k56tkZCI6wOqVgBgMvC1FzYaAQpg
         JWXI8a+XofGHD5E79a2kmd2Fds4XfB1wHR5wNAmBifpVBqfZ2hcT2Bge/A/zD8Z2eAb1
         T5Z7xnuzaxtlcQcO6xv0OyO3EGtOSM7UHZRPGo67OjHp+ec69ncsBoerNEEvPmue1QhM
         1eEyYNXjVr/0c20xdbE/VtGj2n4WxiE9XNi97f/18d2DbNd5PAs8iWKq8Xnnatxfavz0
         jrESzOjs3jE6cnDJZ4W2Cy/7tqQAciDUHK+cODn683c8sUoZw0cd1grGDaoSs5fzJ52U
         JIEw==
X-Gm-Message-State: AOAM532eMeB/NuEczTpMOk62mMqbrJozTk4F44uYY+c0zG1Rl8G8CsC0
	wmqYUefbB4GGVWm15hn2pCgGH1KbS+1fpeIT
X-Google-Smtp-Source: ABdhPJzlgHkwlejsr1avAj9/gFAQG+K6NCZPLG7Xhn5MzUw3nk3kIMxtTc3hc2ajt0ZwWSLszmRQ7g==
X-Received: by 2002:a37:9986:: with SMTP id b128mr3705650qke.290.1599147155896;
        Thu, 03 Sep 2020 08:32:35 -0700 (PDT)
Return-Path: <josef@toxicpanda.com>
Received: from [192.168.1.45] (cpe-174-109-172-136.nc.res.rr.com. [174.109.172.136])
        by smtp.gmail.com with ESMTPSA id b9sm2239517qtt.39.2020.09.03.08.32.34
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 08:32:35 -0700 (PDT)
To: tools@linux.kernel.org
From: Josef Bacik <josef@toxicpanda.com>
Subject: [bug] b4 not working with a patch valid patch series
Message-ID: <19d6330d-b1c4-96d3-f081-7cbe1ac07e2e@toxicpanda.com>
Date: Thu, 3 Sep 2020 11:32:34 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

b4 from pip and b4 from git do not seem to be handling this patch series properly

cover.1599091832.git.anand.jain@oracle.com

I'm getting

root@localhost ~/btrfs-next# ~/b4/b4.sh am 
cover.1599091832.git.anand.jain@oracle.com
Looking up https://lore.kernel.org/r/cover.1599091832.git.anand.jain%40oracle.com
Grabbing thread from lore.kernel.org/linux-btrfs
Analyzing 30 messages in the thread
---
Thread incomplete, attempting to backfill
Will use the latest revision: v3
You can pick other revisions using the -vN flag
---
Writing 
./v3_20200903_anand_jain_btrfs_seed_fix_null_ptr_use_only_main_device_list_mutex_and_cleanups.mbx
   [PATCH v3 1/15] btrfs: add btrfs_sysfs_add_device helper
   ERROR: missing [2/15]!
   ERROR: missing [3/15]!
   ERROR: missing [4/15]!
   ERROR: missing [5/15]!
   ERROR: missing [6/15]!
   ERROR: missing [7/15]!
   ERROR: missing [8/15]!
   ERROR: missing [9/15]!
   ERROR: missing [10/15]!
   ERROR: missing [11/15]!
   ERROR: missing [12/15]!
   ERROR: missing [13/15]!
   ERROR: missing [14/15]!
   ERROR: missing [15/15]!
---
Total patches: 1

but looking at the headers for the thread they're all set right, and 
lore.kernel.org shows them in the thread properly

https://lore.kernel.org/linux-btrfs/cover.1599091832.git.anand.jain@oracle.com/

Not sure what's going wrong.  Thanks,

Josef

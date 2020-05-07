Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web11.4054.1588851781096719244
 for <tools@linux.kernel.org>;
 Thu, 07 May 2020 04:43:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=UWRKV+47;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: will@kernel.org)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 18294208CA;
	Thu,  7 May 2020 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588851780;
	bh=EIy1zuMG0mme4R2X5hCNZa6m+zt4LzD/ls/+Fg6KHNM=;
	h=Date:From:To:Cc:Subject:From;
	b=UWRKV+47+L9IcuRClRnL1Mb2DAXYDWVhBJ4Bu1QLYACflpjvlZhQ55NjFC/ZhZx0y
	 na9VY4QC37a8tjFebjmrJC/tRaQMP8NICni+NL2+0+3JGf7eh+xx4KJYXaytoYde4i
	 75OP3PHm9yIWTWJLfiuURhSJ1S1Ykr8XQMydlIYM=
Date: Thu, 7 May 2020 12:42:56 +0100
From: "Will Deacon" <will@kernel.org>
To: konstantin@linuxfoundation.org
Cc: tools@linux.kernel.org
Subject: b4 ty not picking up per-remote git config properties
Message-ID: <20200507114255.GB29541@willie-the-truck>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I've been having trouble persuading 'b4 ty' to honour the 'b4-treename'
and 'b4-commit-url-mask' properties if they are specified on a per-remote
basis. This seems to be because get_branch_info() has expectations about
branch naming to which I'm probably not adhering.

In my specific case, I have a branch called 'for-joerg/arm-smmu/updates'
which has a remote called 'wd-korg', so my .git/config contains:

[remote "wd-korg"]
	...
	b4-treename = will
	b4-commit-url-mask = https://git.kernel.org/will/c/%.12s

[branch "for-joerg/arm-smmu/updates"]
	remote = wd-korg
	merge = refs/heads/for-joerg/arm-smmu/updates

but 'b4 ty' always takes the properties from my top-level .gitconfig.

I've hacked ty.py as below to get things working but, believe it or not,
this is the first time I've written any python so I suspect it's all a
load of rubbish.

Will

--->8

diff --git a/b4/ty.py b/b4/ty.py
index 33baddbeaaa8..04ef63899563 100644
--- a/b4/ty.py
+++ b/b4/ty.py
@@ -560,29 +560,14 @@ def get_branch_info(gitdir, branch):
 
     BRANCH_INFO = dict()
 
-    if branch.find('/') < 0:
-        # Not a remote branch
-        return BRANCH_INFO
-
-    # Get a list of all remotes
-    gitargs = ['remote', 'show']
-    lines = b4.git_get_command_lines(gitdir, gitargs)
-    if not len(lines):
-        # No remotes? Hmm...
-        return BRANCH_INFO
-
-    remote = None
-    for entry in lines:
-        if branch.find('%s/' % entry) == 0:
-            remote = entry
-            break
-
-    if remote is None:
+    remotecfg = b4.get_config_from_git('branch\\.' + branch + '\\.remote')
+    if remotecfg is None or 'remote' not in remotecfg:
         # Not found any matching remotes
         return BRANCH_INFO
 
+    remote = remotecfg['remote']
     BRANCH_INFO['remote'] = remote
-    BRANCH_INFO['branch'] = branch.replace('%s/' % remote, '')
+    BRANCH_INFO['branch'] = branch
 
     # Grab template overrides
     remotecfg = b4.get_config_from_git('remote\\.%s\\..*' % remote)

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web10.651.1589392918441229735
 for <tools@linux.kernel.org>;
 Wed, 13 May 2020 11:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=q8U5Hmr0;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: helgaas@kernel.org)
Received: from localhost (mobile-166-175-190-200.mycingular.net [166.175.190.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 4410820671;
	Wed, 13 May 2020 18:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589392918;
	bh=jK39fK8gmaLAbgXt7p51p8ZTXtQMuaKB5eHBr7nYfKs=;
	h=Date:From:To:Cc:Subject:From;
	b=q8U5Hmr05L/OHyn8z8+gEkyfYXJO8vMNoqwQmgktCAhufWWJ6uohUff5JEbKOFKmr
	 QU/gIU++AAgvILtkN4aDYDFJpvX3Qjq6cgVnCZiaCI/fHJ1gF84SN3pvK5Ym+EMfHR
	 KiH0oTLoColAmoB/5mLyxbzmYqf4ZgwbW8WVTzc0=
Date: Wed, 13 May 2020 13:01:55 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: b4 am issue
Message-ID: <20200513180155.GA332206@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

$ b4 --version
0.4.2

$ b4 am -om/ https://lore.kernel.org/r/f4bbacd3af453285271c8fc733652969e11b84f8.1588821160.git.sathyanarayanan.kuppuswamy@linux.intel.com
Analyzing 4 messages in the thread
Traceback (most recent call last):
  File "/home/bjorn/.local/bin/b4", line 8, in <module>
    sys.exit(cmd())
  File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 184, in cmd
    cmdargs.func(cmdargs)
  File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 40, in cmd_am
    b4.mbox.main(cmdargs)
  File "/home/bjorn/.local/lib/python3.8/site-packages/b4/mbox.py", line 389, in main
    mbox_to_am(threadmbox, cmdargs)
  File "/home/bjorn/.local/lib/python3.8/site-packages/b4/mbox.py", line 42, in mbox_to_am
    lser = lmbx.get_series(revision=wantver, sloppytrailers=cmdargs.sloppytrailers)
  File "/home/bjorn/.local/lib/python3.8/site-packages/b4/__init__.py", line 279, in get_series
    pmsg = self.msgid_map[fmsg.in_reply_to]
KeyError: '20200506203249.GA453633@bjorn-Precision-5520'


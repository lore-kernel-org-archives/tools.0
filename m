Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D71F53A3
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 19:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09CCAC433D6
	for <tools@linux.kernel.org>; Wed, 19 Oct 2022 19:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666208401;
	bh=FCIclzvC4xE9tMmq50GWcjXyOkbO9N6NO4Z/b/AlxFk=;
	h=Date:From:To:Subject:From;
	b=ptE3mPh4korwntScooR8obtDWBUYbGwjN4RsLxGNLgPLwVH4fv8XNO1Lqz64UFral
	 x8ofIL7T94yH64zbaOivNXMg5FwN/Pd4FP7dBzMlepKdQEOfymwLZY6E5+AtI28K0L
	 E76Zz/zV23KlwMPwcf4QTMeA4dF+ncrnKTogEPGsnoA9VDDqlWET+WKCHJcK+UbTCp
	 IrhRFgpmuoqyysEcwHpf/OdLCcPHIWeEYVMRNeIeM3wQDH6nztq7EPNpapcJzXs2Vx
	 fb71OeSMQtqUMC60sfKu/IJnrOYn+PCs08yTo1ux8TkG8arKq04C82TCREYuXUGOLQ
	 dKW877m4RCpqw==
Date: Wed, 19 Oct 2022 14:39:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: tools@linux.kernel.org
Subject: "b4 send" crash
Message-ID: <20221019193959.GA34903@bhelgaas>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I think this is because I ran "b4 send" on a branch without having run
"b4 prep" first.  "b4 send" works as expected after I run "b4 prep".

  02:36:40 ~/linux (wip/bjorn-22-10-irq-of)$ b4 --version
  0.10.1
  02:36:46 ~/linux (wip/bjorn-22-10-irq-of)$ b4 send --hide-cover-to-cc --dry-run
  Traceback (most recent call last):
    File "/home/bjorn/.local/bin/b4", line 8, in <module>
      sys.exit(cmd())
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 341, in cmd
      cmdargs.func(cmdargs)
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/command.py", line 86, in cmd_send
      b4.ez.cmd_send(cmdargs)
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ez.py", line 1150, in cmd_send
      todests, ccdests, patches = get_prep_branch_as_patches(prefixes=prefixes,
    File "/home/bjorn/.local/lib/python3.8/site-packages/b4/ez.py", line 1016, in get_prep_branch_as_patches
      csubject, cbody = cover.split('\n', maxsplit=1)
  ValueError: not enough values to unpack (expected 2, got 1)


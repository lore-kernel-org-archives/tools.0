Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C1A23
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 01:27:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A3BC433EF;
	Fri,  6 Jan 2023 01:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672968431;
	bh=KVN+2qmVPTothBPxoFQMZzJhhBVIFL0IxJrzjwWI6qg=;
	h=Date:From:To:Cc:Subject:From;
	b=cdmyLHQbuoBF3fPIbOxh0ZlcDhuQB0yQ015inBugbHDf2arFLMBHk2gccgV17X2Gk
	 DA2X5N/P5a6GoTUKyo9IpsVeDfNK9AJvAdvWex/C0ySMGBMqg3Sf2b0tTNrYgTF5SY
	 FkEyfvWCt2solqHxBIbjKuE164QIm1jIF5PoDu1ol4CK8+uPk06zpd8N+XLLJ6/ELK
	 hxqQ5dMOyJythrlS4Euzg2nyI/KUk1CyDbjhWayLmtBfuPUOigvAEzarGlY3+u81yG
	 YmxsnXH2kQqS7WCwX1w2AO+VncT6nnCOhrsX0t4+gBPwMMB+mmoQo3Ye3JR62hxw9O
	 OXKi8KyZ6ihew==
Date: Thu, 5 Jan 2023 18:27:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Subject: Address from trailer on individual patch is sent entire series?
Message-ID: <Y7d47SDIpjPBxEwi@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I was going over my recent "sent with b4" series and I noticed that the
kernel test robot, a Reported-by: on a specific patch in the series, was
Cc'd on the entire series.

Patch with trailer:

https://lore.kernel.org/linux-kbuild/20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org/

Patch without trailer still has Cc:

https://lore.kernel.org/linux-kbuild/20221228-drop-qunused-arguments-v1-5-658cbc8fc592@kernel.org/

I would have expected this to behave like explicitly provided patch Cc's
so that the kernel test robot would have just received that patch and
the cover letter? You can see the raw series from tree on kernel.org, as
I pushed the v1 tag that 'b4 send' generated:

https://git.kernel.org/pub/scm/linux/kernel/git/nathan/linux.git/tag/?h=sent/drop-qunused-arguments-v1

in case you need to see anything there. If I have missed some
configuration option or other problem, please let me know!

Cheers,
Nathan

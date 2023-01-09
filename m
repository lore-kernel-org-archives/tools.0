Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C922F21
	for <tools@linux.kernel.org>; Mon,  9 Jan 2023 14:15:21 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:15:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
	t=1673273718; bh=ShxeNkQythqJ7iw5kZOic6OaobnPkrB49HSmNyC2jHY=;
	h=Date:From:To:Cc:Subject:From;
	b=HFx6zk/1Zb4WxAayMp3ahyuzMcJJlX2akOEEGpd0RZX457GuwwlWOv6pvEu/ckTOL
	 B2p+rF0r/rP6MSMQQhajdM3MsvqCj8YoecohVABvFMcPC9DvrKeSa31GPy27q4qnmI
	 nWOsk+jp/iCVmzBTWT5jKnX2DNKghVDKK2O97o+o=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [BUG b4] misformatted email recipients
Message-ID: <20230109141516.ddljbbkzwk74bfwe@snowball.t-8ch.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

it seems in certain cases b4 will misfold/misformat email recipient.
The exact conditions are that a long address line pushes the comma
separating different addresses to a new line during folding and that
line contains unicode data that is encoded.
In this case the comma is also encoded.

The root cause is a bug in Python email module [0].

Such misformatted mails are rejected by some mail servers, for example
infradead.org.
Also it seems they are not indexed by public-inbox [1].

I hit this case in the wild [2].

Thanks,
Thomas

[0] https://github.com/python/cpython/issues/100884
[1] https://public-inbox.org/meta/20230108200233.y2zqecm3ob47gsdd@snowball.t-8ch.de/
[2] See thread-view on https://lore.kernel.org/lkml/Y7VxkG0ZsfJEyuFP@kernel.org/

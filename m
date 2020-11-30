Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.1569.1606776670603142933
 for <tools@linux.kernel.org>;
 Mon, 30 Nov 2020 14:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linuxfoundation.org header.s=korg header.b=ZxsRbOCp;
 spf=pass (domain: linuxfoundation.org, ip: 198.145.29.99, mailfrom: konstantin@linuxfoundation.org)
Received: from localhost.localdomain (unknown [89.36.78.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 437A120725;
	Mon, 30 Nov 2020 22:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1606776669;
	bh=JBGvlgLK6hnHWRjYUysz15zSelj3HxSQrhFEIwj9CSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZxsRbOCpWDqxOp8J7S3wH7nZd0T3E2peoXRzQJ63dwOZ4bEF3w2dLmsin1pfajZrv
	 1KVQWWePcvK/c2rY8loTJpKBdoxA0TW1ll6Yumwbo0X1Y0Rx9lsnMAsW3t2HMGhnZB
	 p/LWmmNluX5gfRNnB/AfrKyepG9TonIGRMQKJdOs=
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: Kyle Meyer <kyle@kyleam.com>,
	tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4] man: Drop apostrophe from midmask value
Date: Mon, 30 Nov 2020 17:50:50 -0500
Message-Id: <160677649486.1027712.12685174241776267428.b4-ty@linuxfoundation.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201128064206.4373-1-kyle@kyleam.com>
References: <20201128064206.4373-1-kyle@kyleam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Nov 2020 01:42:06 -0500, Kyle Meyer wrote:
> 55913ca (man: Drop the apostrophe from the linkmask configuration,
> 2020-06-25) removed a spurious apostrophe in the linkmask value.  Do
> the same for the midmask value.

Applied, thanks!

[1/1] man: Drop apostrophe from midmask value
      commit: 97ed3503d7493cd3f9a9bfaa7adf5db885f94e63

Best regards,
--=20
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

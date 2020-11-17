Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web09.14471.1605647168367227510
 for <tools@linux.kernel.org>;
 Tue, 17 Nov 2020 13:06:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linuxfoundation.org header.s=korg header.b=bbQvmyY2;
 spf=pass (domain: linuxfoundation.org, ip: 198.145.29.99, mailfrom: konstantin@linuxfoundation.org)
Received: from localhost.localdomain (unknown [89.36.78.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0975124181;
	Tue, 17 Nov 2020 21:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1605647167;
	bh=o/ihaThYlwfaUw7kEX+kqigkExdYVnNzpqDbHoUCYcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bbQvmyY2Y8HmVfspOJPFL9uiNE6RV6KKfFuwDjuWfo4wgLrgbVmCgVmEiRq8yTI7J
	 RbgKz4g+4+/CruBfs7yChLviSoC4TnkzbR24Cr+h43mlC96VWMbjzWfpu8kXgQ6FdW
	 eX77jIMF0VJIpnTbFIvBMdHNw3yhoYg9ZhCmLeIQ=
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org,
	Philippe Blain <levraiphilippeblain@gmail.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH b4 0/4] Add the man page to the pip package
Date: Tue, 17 Nov 2020 16:05:51 -0500
Message-Id: <160564703062.1131974.3510474628810036601.b4-ty@linuxfoundation.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
References: <20201112152134.96498-1-levraiphilippeblain@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Nov 2020 10:21:30 -0500, Philippe Blain wrote:
> I'm already convinced it will be a great addition to my workflow.
>=20
> I noticed that the man page is not installed when you 'pip install' the
> package, so patch 4/4 in this here series takes care of that.
>=20
> The other 3 patches are project-level goodies that I thought were good
> additions. Feel free to drop them if you don't think so.
>=20
> [...]

Applied, thanks!

[1/4] Add '.venv' to .gitignore
      commit: 7804e65259d192a1c5bfaa49954d15be486646f7
[2/4] Link to the README from PyPI
      commit: fdd09fd76177a55ac67006057fac32b4a907c3f5
[3/4] Add pointers to https://linux.kernel.org/g/tools
      commit: dc5f193cb5db91279fbbb3a13c9e59e659afd39b
[4/4] Distribute the manpage with the pip package
      commit: cc6bbbeb1c824da64a59fbd1a483c780bc121c3b

Best regards,
--=20
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

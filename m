Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077E130DD03
	for <tools@linux.kernel.org>; Wed, 28 Jan 2026 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624085; cv=none; b=UU6MkNtfGPxSyQfKyFthBHS1UtjaQhyn8RdSUj8mgUPDnwPvaL471O4thsOWKVG86CvW4eWC8exZ9tll3AZmIcVx6pdA76pe1NvQIhL7ap5kfSN9rAY2ngdAtJAZCy/nZeV9cNBrqciev6WCYZ9vb2AkEadt9Qz5IaW++B+qjFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624085; c=relaxed/simple;
	bh=/PGdjzdikCSrAsAcKxTxFxWHUyHuzgYwfhZmScXlHL8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=LZcIvA8spAJ8Ruj3zqjf/2/GxanbCCbizGAXYVocJqVxc6SXs6fwAoNOLBDT8Kso+FxPvAMeXV9YLNWqfNFEw6I035PnOu9V0kYYipBsDnKSfOdd4mpcfUuYltaFUv7yFprCrPjwwca7LNbqO6/yI1r6KO1Dy2wcnoux583D9YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=t4Ui85Fk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="t4Ui85Fk"
Received: by smtp.kernel.org (Postfix)
	id AC8C7C4CEF7; Wed, 28 Jan 2026 18:14:44 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A67DC4CEF1
	for <tools@kernel.org>; Wed, 28 Jan 2026 18:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3A67DC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 15211C211ED;
	Wed, 28 Jan 2026 18:14:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 673A16071F;
	Wed, 28 Jan 2026 18:14:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F97A119A8687;
	Wed, 28 Jan 2026 19:14:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769624079; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6zrkHuphomsZXJG7TcOIvbTK42IoQBhIMCXKJDIIDGQ=;
	b=t4Ui85Fkj5xXN2X2soWotYmo2ba+D9w9sDTP8Pmi00x8lK+3YdGhrTlIUfsbmmQywEZSDv
	mdV/T26cIaoDSCHSVtYd2It8416SwnEib24ZMA/VmxVBSh3R3IA5FPtpuAOH/7eepBtg3w
	Azwir8DLFDx5RN61k0IKbMPgwim2LxeYQZR0FD+DSgpnGKWrKG4qotqHFFTjyrDUDToL16
	vspXjx8KwJ3/IXNMBkuzjmreC8dhUpt6G+zntY0wT+65Q7awbM6/zj6Pc4YsSIXQmWX2jr
	hdrq2EadnVhpcRCwGTDDnawqJVQlK7L8GlN07aF0r12Rv52RWW0KNIm8hNqBPw==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 19:14:37 +0100
Message-Id: <DG0FDQ2I7T4R.Z5XKN00DAQ42@bootlin.com>
To: "Breno Leitao" <leitao@debian.org>, "Kernel.org Tools"
 <tools@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate
 cover for single patch patch series
Cc: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
 <kernel-team@meta.com>
X-Mailer: aerc 0.20.1
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
In-Reply-To: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
X-Last-TLS-Session-Version: TLSv1.3

Hello Breno,

On Tue Jan 27, 2026 at 1:53 PM CET, Breno Leitao wrote:
> By default, b4 mixes the cover letter content into the patch body
> (under the --- cut line) when sending a single-patch series. Add
> --force-cover-letter option to allow sending a separate cover letter
> message (as 0/1) even for single-patch series.
>
> This is useful when developers want to send a long cover letter with
> extra information about an issue, and a commit. Having the cover-letter
> "mixed-in" makes it hard to follow.
>
> Example:
>  * https://lore.kernel.org/all/20260127-ipmi-v1-0-ba5cc90f516f@debian.org=
/
>
> Signed-off-by: Breno Leitao <leitao@debian.org>

Thanks! This is a feature I had requiested some time ago [0] so I'm very
heppy to see it implemented.

I just tested it successfully to send a 1-patch series [1].

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

[0] https://lore.kernel.org/tools/20250619113855.6a271fa6@booty/
[1] https://lore.kernel.org/lkml/20260128-drm-bridge-fix-imx8qxp-pixel-comb=
iner-null-deref-v1-0-2138d0933cf1@bootlin.com/

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

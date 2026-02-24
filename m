Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C33A9DA8
	for <tools@linux.kernel.org>; Tue, 24 Feb 2026 17:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771955011; cv=none; b=hw10/DByrOsUEa2OKP4UA2C8POZaIVcK7V8Y/5PIHyh3gFtYD5fLawA4mIZAMhW+3egQn71z9AyA3zxGv4JCPBsmfoLJWSEbjeIJKNvt6Ix0kVwZ3a+SiZjG/YFHRnneaI5lLrEzawZdMDf1NSraO253Hmu3g0AmR9dZ4BTtSLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771955011; c=relaxed/simple;
	bh=sNnxa9FSryZ47mHyv1MjSo7Ckbmwi61rm7HmqrtN0Qg=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Wu3rQnEzQ/YrPJFc9oHILO48fW3i7828JoTreZof06FbPQD/4SYq7Clb2W9o41CB4gnpwceqH2X8CmDF+3+k7+jyMymcW+ynbhyMO0L66/Igp4n+mZWZ1fHUHFmEliLwTEzsIdYaGvTYsEApGGWXMoQGVjjT5V5GR9qQj3xbWyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=I9Wr+KCd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="I9Wr+KCd"
Received: by smtp.kernel.org (Postfix)
	id 7C576C19423; Tue, 24 Feb 2026 17:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 122E1C116D0;
	Tue, 24 Feb 2026 17:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771955011;
	bh=sNnxa9FSryZ47mHyv1MjSo7Ckbmwi61rm7HmqrtN0Qg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=I9Wr+KCd0kfLrriyfPv6gzkEOMIFXFQ69VTpaTLXa1wjeKu9jd0ucI0o36sZErPJg
	 a+69fnL3NAmlmj4ChjieV1pWFRK3GF4z5vhN6MxRctcUCLHrVw1l1UOzTKTSJNO34B
	 XYFHhcSYDhEMK/0cMFfKaPCiDZM7x7esDkUh+uCE=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4] docs: document --set-presubject and
 b4.send-presubject
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260121-docs-presubject-v1-1-d625a279f1c5@bootlin.com>
References: <20260121-docs-presubject-v1-1-d625a279f1c5@bootlin.com>
Date: Tue, 24 Feb 2026 12:43:18 -0500
Message-Id: <177195499898.4002465.17583596122781041255@lemur>
X-Mailer: b4 0.15-dev-1529f

On Wed, 21 Jan 2026 13:28:35 +0100, Antonin Godard <antonin.godard@bootlin.com> wrote:
> Document the b4 prep --set-presubject option and b4.send-presubject
> setting, added by commit d7232f5db2e4 ("Add support for setting a
> presubject").

Thank you for sending this in! I'll take this if you can send a small 
rebase -- the latest doc format uses .. versionadded:: directives. See 
below.

> diff --git a/docs/config.rst b/docs/config.rst
> index a1145af..af470fc 100644
> --- a/docs/config.rst
> +++ b/docs/config.rst
> @@ -437,6 +437,17 @@ Contributor-oriented settings
>  
>    Default: ``None``
>  
> +``b4.send-presubject`` (v0.15+)

On latest master, config.rst has been migrated to glossary format. This entry
should use :term:`b4.send-presubject` and a .. versionadded:: v0.15 directive
instead of the inline (v0.15+) annotation. See the neighbouring
:term:`b4.send-prefixes` entry for the expected format.

>
> diff --git a/docs/contributor/prep.rst b/docs/contributor/prep.rst
> index 18c710d..59cedc0 100644
> --- a/docs/contributor/prep.rst
> +++ b/docs/contributor/prep.rst
> @@ -444,6 +444,27 @@ modifying defaults for some of these flags.
>    Similar to ``--set-prefixes``, but will add prefixes to any ones
>    currently defined, as opposed to completely replacing them.
>  
> +``--set-presubject [PRESUBJECT]`` **(v0.15+)**

Same thing here.

Otherwise, looks good!

Thanks,

-- 
KR


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5676352927
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685528; cv=none; b=Oc0oMMo18vqAvdvXM3PQSSxHNXxvXYal1T6rDLGz3jlFP/S84TPhpYgHe+bBiY7CxS2PP5WXoDLm6wxfKwp1A3zaVJMiru/+ODdT5GLE0LeKCr2fmK5gC437Rmyyo2hygfWHkEbDCRjey5tx5ufTKtnmMjbJ6T2eYKT7qiijL8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685528; c=relaxed/simple;
	bh=8c/jeqoWiP9osrYb8sDOX15bUz8KbDAlLeusT0RdiDM=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:Mime-Version:
	 References:In-Reply-To; b=DbClfVVc/FXD44CPTKqyvV+7dEIkre+t/NFPNKZAg6ZASbU2BoMZB5jU53xzNLBx1qhm4phC9VmGwevvLfIreWUqmr7/ABuM3FokhhN3EMcBJ6N4OvQ4geAWBuvNFP04wjheID43S2rV2haqwjR7ehxa7i5F6JmzXkzKPmyhUoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CgliF6g6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CgliF6g6"
Received: by smtp.kernel.org (Postfix)
	id 6FA28C116D0; Thu, 29 Jan 2026 11:18:48 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B50E8C4CEF7
	for <tools@kernel.org>; Thu, 29 Jan 2026 11:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B50E8C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DF5DF1A2AFD;
	Thu, 29 Jan 2026 11:18:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B5FA1606B6;
	Thu, 29 Jan 2026 11:18:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B4B8119A868D;
	Thu, 29 Jan 2026 12:18:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769685523; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=laYnNaREOXp0GSR6wj9WIP9wdujmrDUrjH5FIQj4H9Q=;
	b=CgliF6g6M73urnSdinfORv7FYw4A469x8C3Iuj8WoV78//4VdE/o5KKPMtQnV4S8DFOXUE
	Q1a5eMPQtYcy215BwS6Rfnkyb5icsE3l4m6/POZEljeDJ7Evw/CThMjkqzXj2An5Bq5Qqm
	Mr8sEPReiVBIhycPIpzIdaaQFDimvBoK2klwB5jTVrGykwFJq5qJTdxeceUUeRzImx9knH
	RgXgmKohTv5chOqJ6itr7wEFTmw8+GsN5OEYhuHXDfVBwX3EcAc5ur0CU8DREjHC4HYCfn
	U57TvtcjrP7vSg+KE1ad157640DCS14lE89tEnMUspDATiw3pdPcPp3pkyuDSg==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 12:18:41 +0100
Message-Id: <DG115TDKJFHA.2VQ4J0C51DKHX@bootlin.com>
Cc: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>,
 <kernel-team@meta.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Breno Leitao" <leitao@debian.org>, "Kernel.org Tools"
 <tools@kernel.org>
Subject: Re: [PATCH b4] send: Add --force-cover-letter to send separate
 cover for single patch patch series
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
References: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
In-Reply-To: <20260127-force-cover-letter-v1-1-1ba8d7f9a64f@debian.org>
X-Last-TLS-Session-Version: TLSv1.3

Hi,

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
> ---
>  src/b4/command.py |  2 ++
>  src/b4/ez.py      | 16 +++++++++-------
>  2 files changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/src/b4/command.py b/src/b4/command.py
> index 1f8b8f1..0e685cd 100644
> --- a/src/b4/command.py
> +++ b/src/b4/command.py
> @@ -397,6 +397,8 @@ def setup_parser() -> argparse.ArgumentParser:
>                           help=3D'Resend a previously sent version of the=
 series')
>      sp_send.add_argument('--no-sign', action=3D'store_true', default=3DF=
alse,
>                           help=3D'Do not add the cryptographic attestatio=
n signature header')
> +    sp_send.add_argument('--force-cover-letter', action=3D'store_true', =
default=3DFalse,
> +                         help=3D'Send a cover letter even for single-pat=
ch series')

I've had a different idea with this which would go a bit further.

Instead of --force-cover-letter, have a --cover-letter option which acts as
follows:

* --cover-letter=3Dyes: always generate a cover-letter, no matter if it's a=
 single
  patch or not

* --cover-letter=3Dauto (default): generate a cover-letter when there is mo=
re
  than one patch. This is the current behavior.

* --cover-letter=3Dno: do not generate a cover-letter, even on multi-patch =
series

This would be backed up by a setting (b4.send-cover-letter?) which can be s=
et
globally or on a per-branch basis.

I don't know how easy it would be to support the last use-case though, as I
don't know how b4 is going to behave with a multi-patch series with no
cover-letter, but since you figured out the code paths I guess it would be
relatively easy to try? Obviously, --edit-cover would have to be adapted as=
 well
to refuse editing the cover when --cover-letter=3Dno.

I do find myself needing the last use-case sometimes, when the series does
not require a cover-letter.

What do you think?

Antonin

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B10F2E974D
	for <tools@linux.kernel.org>; Thu, 26 Feb 2026 10:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100097; cv=none; b=miI9chNRvlsGHRQPwaUv7IdK8efST6GY39Hvq32WujC106s39GawwGYGrXrJFb7v4FEcnR5SHLxITt1We73ZOFyHHQfBpFwT5hS39wkbokZy5JDDSdK0LZF3003goyTZev1qaCu6ufP3NfSiQEX8e1sBejxPJ6P1w92BoDbPdcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100097; c=relaxed/simple;
	bh=U+LEtzn4mw5uMq5vCR/6Y9bbRfAQNss92AidFKh/JtA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Rd7sChsS3P1mVsPMdBhZYvToqP64tiVp3HEBKyr3U4goEM4od/vm4QCy8AXn9qr7j+emJfAjAlwg2WvuWGWIoTYEQ4l08rgOF2NjKSa5Np/j8SjmtXwBxG8WPhIVswyrxPhoV0hVu6Y+07xSY8WxD2OEpteytkMG7vKqhtoirao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VmoGwdu/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VmoGwdu/"
Received: by smtp.kernel.org (Postfix)
	id F15D2C19423; Thu, 26 Feb 2026 10:01:36 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3680DC19422
	for <tools@kernel.org>; Thu, 26 Feb 2026 10:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3680DC19422
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 43C5D1A13A9
	for <tools@kernel.org>; Thu, 26 Feb 2026 10:01:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF585FDEB;
	Thu, 26 Feb 2026 10:01:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62A9D103682F9;
	Thu, 26 Feb 2026 11:01:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772100087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U+4p9OLBCApakeHanjAYcWAzsT2DHs5kgd34w4n16e4=;
	b=VmoGwdu/lR6XKRJR0zL4Wdh/VY2Ykn2HalxIWogWsW9N0h0n9onmYqHPyBN6CM36K7ChQp
	XIX7pB3WnyGi+Hv+h0KVjnOF+iuQk2NnTTIeHii2CzJndL8xynqt7UMYSLNWp1znUrhYCr
	wxO4eDJtJH9On/TUSpXRHCS7YWGC6kldoHUANFROdoY5tyamad9q1pi41/0HJMAS52Mo7g
	gMJI943Xj7rHzrZV4rf6tQw69kVw9fTPzvx+Bl60gbjp5nnTu7rV+dG8l+QldY0cjz/cP2
	3d1YQ4Rng8BT8xY4/ffW4s3sfWN7ZKLzHPkieYYKahlrmiWUHI4K58vEtbY5lg==
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 11:01:27 +0100
Message-Id: <DGOT1XCCB2WG.3GJBE8M8LD46A@bootlin.com>
Subject: Re: [PATCH b4 v3] ez: allow cleaning multiple branches at once
Cc: "Kernel.org Tools" <tools@kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
References: <20260225-multiple-prep-cleanup-v3-1-db77b14dfdd1@bootlin.com>
 <177202967796.9138.1869608270063220594@lemur>
In-Reply-To: <177202967796.9138.1869608270063220594@lemur>
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Wed Feb 25, 2026 at 3:27 PM CET, Konstantin Ryabitsev wrote:
> On Wed, 25 Feb 2026 13:59:48 +0100, Antonin Godard <antonin.godard@bootli=
n.com> wrote:
>> Allow "b4 prep --cleanup" to cleanup multiple branches in one go. If an
>> error occurs (branch not known/empty branch/currently checked out), just
>> return to continue cleaning up branches. Give the user multiple options:
>> "y" to cleanup, "n" to skip, "q" to abort the cleanup, "s" to show
>> the branch log with diffs, and "?" to print help about these options.
>>=20
>> Passing nothing to --cleanup still shows the available branches to
>> cleanup.
>
> I have a few tiny notes, but I hope we can get them addressed. :)
>
>> -    mybranch =3D param
>> -    if not b4.git_branch_exists(None, mybranch):
>> -        logger.critical('Not a known branch: %s', mybranch)
>> -        sys.exit(1)
>> -    is_prep_branch(mustbe=3DTrue, usebranch=3Dmybranch)
>> -    base_commit, start_commit, end_commit =3D get_series_range(usebranc=
h=3Dmybranch)
>> +    if not is_prep_branch(usebranch=3Dbranch):
>> +        logger.error(f'ERROR: {branch} is not a prep-managed branch')
>
> This is a nitpick, but in general it's preferred to use %-formatting for=
=20
> logger calls, because this skips unnecessary interpolation when not=20
> needed. So, in this case it should be:
>
>   logger.error('ERROR: %s is not a prep-managed branch', branch)

TIL! I'll send a v4. Thanks.

Antonin

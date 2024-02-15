Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD9B13956F
	for <tools@linux.kernel.org>; Thu, 15 Feb 2024 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708024670; cv=none; b=s/Ceob9wV6AWTcgX6ynjxmJe3oQcRR/fzmV+QMWD29kNtVDikSoZwuXtguxut/AOEf+yef/Iq9wRkqO0fzAN2lu5finsDTnPm+k3KuMzh7fqJhhrxgADO/Tz6NLUAxkZ83bei9GHR6Cl8m89OSujkuvvdCNQ1kCGz+d3jiUQF4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708024670; c=relaxed/simple;
	bh=De6ZODAKt5L36zY0yhCKyFn9iUO/zk1/I5VZT5wqsJ8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ee122Du3INtV7KUOxCDjvRcXh4Row4sVl1ZuaskGugjygyC9gZxau+uIzrxTb0qw9jQx3WEcFfkB2yKbY2/jBueetpyaS0p9LMRXsrp8njkBmeuDU7D51XupHr753BYerEnnntqF23FlBZDpVAjDrLaOpF77f60GBExjAe5ApCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vt1aE7z+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vt1aE7z+"
Received: by smtp.kernel.org (Postfix)
	id 4C01FC43394; Thu, 15 Feb 2024 19:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18720C433C7;
	Thu, 15 Feb 2024 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708024670;
	bh=De6ZODAKt5L36zY0yhCKyFn9iUO/zk1/I5VZT5wqsJ8=;
	h=Date:From:To:Subject:From;
	b=vt1aE7z+bxWErubJ673xk+aTZ7RqDqCV2r8GeRhLZtc75rtggf6w04Jjyp0S7FLQ2
	 X+2S8XLIuvuy5INYbqIJmZCQoJhute/vZJRcZPwSTwMSUPpi5BsTwzqqnHEntPCryQ
	 PfccIRV+sOcfowZsTOvvyDI9rF5SQesNDBD6sBSA=
Date: Thu, 15 Feb 2024 14:17:47 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, users@kernel.org
Subject: b4 0.13.0 available
Message-ID: <20240215-refreshing-spotted-kiwi-ae2e99@lemur>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello, all:

I am happy to announce the release of b4-0.13.0. There are no major new
features that were introduced since 0.12, but there are enough feature updates
to warrant a "Quality of Life" point-release.

# Updating

If you installed via pip, you can upgrade using:

    pip install --upgrade b4

If you're using b4 via the git checkout, you can either update to latest
master, or checkout the new stable-0.13.y branch. You can also download signed
tarballs from the usual location:

https://kernel.org/pub/software/devel/b4/

# Notable changes

Besides the usual bugfixes, some of which have been backported to 0.12.y
already:

## am, shazam
- `b4 am` now has a `--single-message` flag that lets you process a single
  message and ignore any other parts of a thread; this is useful when there is
  a patch series sent as attachments to a single message
- `--apply-cover-trailers` is now the default behaviour
- when patchwork integration is configured, `b4 am` will attempt to retrieve
  the CI status of patches

## prep, send
- `b4 prep --show-info` can do a lot more now, including showing information
  about branches that aren't currently checked out
- `b4 prep` gained a --cleanup option to properly archive and remove old
  b4-prep-managed branches
- `b4 send` has a `--preview-to` option that lets you send a pre-review of your
  series to your colleagues, mentors, or bosses
- various fixes and improvements to `b4 send` functionality

## Other notable changes
- b4 can now take config options on commandline, allowing to override global
  configs via scripted invocations
- improvements to `b4 diff` that should make it work more reliably for series
  without exact object matches

# Special thanks

As usual, thank you to the following people who all helped with the release
(in the reverse-changelog order):

- Philippe Blain
- Marcos Paulo de Souza
- Nikolay Borisov
- Miquel Raynal
- Lucas De Marchi
- Nicolas Schier
- Steven Rostedt
- Mark Brown
- Dan Williams
- Ira Weiny
- Mario Limonciello
- Jani Nikula
- Leonard Göhrs
- Geert Uytterhoeven
- Andrew Cooper
- Joel Granados
- Duje Mihanović
- Erik Schilling
- Josselin Poiret
- Christian Brauner
- Maxime Ripard
- Palmer Dabbelt
- Conor Dooley
- Rob Herring
- Dominique Martinet
- Matthieu Baerts
- Nick Desaulniers
- Michael Ellerman
- Alyssa Ross
- Alison Schofield
- Marc Kleine-Budde

That's quite an impressively long list!

Best regards,
-K

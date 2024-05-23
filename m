Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4D6AAD
	for <tools@linux.kernel.org>; Thu, 23 May 2024 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716476708; cv=none; b=kH765C/cPswiaDz5EHr9Owxpksd6zcW1vGO3kIm6qhoPzV7C5Ai6r1ErhQ595t7baEkMqC0/uLac2sbTumlqrULCir4WyMUy/H/x813cj+Afmq9hxucIFZ6IYq50qoYMcbJUCYDw60bB0yUF4CtlM+lTN/+zz0bAN8pMvzlzmhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716476708; c=relaxed/simple;
	bh=0fdb4w70mn+S/ThYdtqVdSwY2sQKndaCZwJyKrjDJ7Q=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qs1oC3sQyE29S4ZYr2PUZRrlOtnbss80S4+cn+XJ0o52NGa5/XHlX/um1YjBzR/Ypf7cTGOQORFJrkJnUSdZLb12fuwROpgBkcyoToezRR7ow5jbsrdoJ3nrasjYkUwwh/mjOyTSrpMgQBSv9ngHO9jGQdMix3P2NY1C1Yl4c9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id AA13EC4AF0C; Thu, 23 May 2024 15:05:08 +0000 (UTC)
Received: from gnu.wildebeest.org (gnu.wildebeest.org [45.83.234.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 28732C32786
	for <tools@kernel.org>; Thu, 23 May 2024 15:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 28732C32786
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=klomp.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=klomp.org
Received: from r6.localdomain (82-217-174-174.cable.dynamic.v4.ziggo.nl [82.217.174.174])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gnu.wildebeest.org (Postfix) with ESMTPSA id C173A3031F64;
	Thu, 23 May 2024 17:04:55 +0200 (CEST)
Received: by r6.localdomain (Postfix, from userid 1000)
	id 7EB81340428; Thu, 23 May 2024 17:04:55 +0200 (CEST)
Message-ID: <1d2e23045066a2f390b57cb1212d95bb01100e7a.camel@klomp.org>
Subject: Re: [PATCH] main: Use inbox.sourceware.org for repos hosted there
From: Mark Wielaard <mark@klomp.org>
To: Jonathan Wakely <jwakely@redhat.com>, tools@kernel.org
Date: Thu, 23 May 2024 17:04:55 +0200
In-Reply-To: <20240523143752.385810-1-jwakely@redhat.com>
References: <20240523143752.385810-1-jwakely@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Spam-Flag: NO

Hi,

On Thu, 2024-05-23 at 15:30 +0100, Jonathan Wakely wrote:
> Like the kernel, the GNU toolchain projects hosted on sourceware.org all
> use email-based patch submission/review processes, and a number of
> people are using b4 with inbox.sourceware.org now. This streamlines
> things for those people.
>=20
> I don't know if this patch would be acceptable for b4. It's obviously
> very specific to sourceware projects, but then the existing default is
> very specific to the kernel! :)

Thanks! I would really appreciate this this could be accepted. It would
be really convenient, not just for the four GNU toolchain projects
hosted at sourceware but also the other 20+ core toolchain and
developer tools (annobin, bzip2, elfutils, libabigail, newlib,
systemtap, valgrind, ...) https://sourceware.org/projects.html

> Of course this wouldn't scale if every public-inbox installation wanted
> to hack b4 to work for their case too, but maybe GCC, Glibc etc. are
> significant enough to deserve this special case.

This is probably overdesign, but maybe we can implement a standerd DNS
(c)name for a git domains providing a public-inbox instance? So you
could lookup if public-inbox.<git-origin-url> exists?

Cheers,

Mark

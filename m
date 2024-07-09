Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32A2BAE5
	for <tools@linux.kernel.org>; Tue,  9 Jul 2024 18:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720548204; cv=none; b=C+NT4hN/YVSc6G/LCJ9pddPfQfjgK4WiflWEhRxila7xKa765HADrC4mJQSuyRci/tsbVSEWuER9VfeTS8x23Gd82IdwMIonFaVSVedoVBOGS9xuswYAXXc2qHR5FmZQSLF+6ue7nhyGfrNQCiiDeyFOhU8usqwunJt3S4YHBvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720548204; c=relaxed/simple;
	bh=2fABZQJerJLFjaKEPsjsmv0ReFobSn874OJy/iZ+cCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAq6SlnctuZ5eEP+RhWiuzAKz78MRay4pJs24E+Nh5iFC7bhZApN/zti0NRQNgwvUxEFQiKSA7ex3Jqj49mFb97n6NFrGawdOiI2xwZldlkNyHazRVcgB1LejaignDAjO9oa19HPgUJAKzr6bmemq5VCJPprzDXYYmpbuhkgKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J5argB8B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J5argB8B"
Received: by smtp.kernel.org (Postfix)
	id 07638C32786; Tue,  9 Jul 2024 18:03:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3DD3C3277B;
	Tue,  9 Jul 2024 18:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720548203;
	bh=2fABZQJerJLFjaKEPsjsmv0ReFobSn874OJy/iZ+cCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J5argB8Bki0oZ4iPJ3mAGBWIsERa6d58bocdtCxfOv0xkwulAzHEpr6PuLGHwCFQ3
	 i2HSTrYlVrLFH4EucUuadwDFic7HbRn6OzPHrhq4FexZ16caMCLiO6uiR+QJCRVhFX
	 ghK4mpTYxQUM4Swmt8DzLoxmC6ucleAdeYIbGWAc=
Date: Tue, 9 Jul 2024 14:03:16 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@kernel.org
Subject: Re: b4 shazam --single-message still grabs the full series
Message-ID: <20240709-invisible-melodic-mongoose-2115eb@lemur>
References: <475803b5-3cc3-4da9-94b8-c2ec648d0c35@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <475803b5-3cc3-4da9-94b8-c2ec648d0c35@citrix.com>

On Mon, Jul 08, 2024 at 02:43:43PM GMT, Andrew Cooper wrote:
> Hello,
> 
> $ b4 --version
> 0.15-dev-13183
> 
> $ b4 shazam --single-message 20240708080456.401764-1-Jiqian.Chen@amd.com
> Single-message mode, ignoring any follow-ups
> Grabbing thread from
> lore.kernel.org/all/20240708080456.401764-1-Jiqian.Chen@amd.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>   Added from v11: 9 patches
> Analyzing 35 messages in the thread
> Will use the latest revision: v11
> ...
> Total patches: 8
> ---
> 
> https://lore.kernel.org/all/20240708080456.401764-1-Jiqian.Chen@amd.com/
> is the correct single patch that I want.
> 
> The help text for --single-message certainly seems to indicate that it
> should ignore everything else.  Also, passing a -v doesn't do the right
> thing either.
> 
> I suspect the underlying problem is that in this case, a single part of
> a larger series has be split out for backport.
> 
> How am I supposed to express "literally this exact email and nothing else" ?

Looks like this is only true for shazam, probably due to some "magic" we try
to do that conflicts with --single-message.

For now, you can work around this by running "b4 am":

    $ b4 am -o/tmp --single-message 20240708080456.401764-1-Jiqian.Chen@amd.com
    Single-message mode, ignoring any follow-ups
    Analyzing 1 messages in the thread
    Analyzing 5 code-review messages
    Checking attestation on all messages, may take a moment...
    ---
      ✓ [PATCH v2] x86/physdev: Return pirq that irq was already mapped to
      ---
      ✓ Signed: DKIM/amd.com
    ---
    Total patches: 1

bugbot assign to me

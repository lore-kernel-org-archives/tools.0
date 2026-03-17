Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D243E4C94
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756689; cv=none; b=cQYQ2lZV/rcNC8qaHlLKFAqzBesXz7/C4nFoJVzeV/70f2IWumCGBSZydgxjipwas0jWvkOBi2kEmnRVOEMuuFLo1ZtDcBvoqCVGy5x17QxLUH4UBr8mimUf021ftg5abm9uqY6Z/Fqc3WOFVc4yC5eio7BbspwthYne0yFf+MI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756689; c=relaxed/simple;
	bh=g7ndtqv3Bd0ZNL3KBViwSNtRaadCnCvlCKJqnu+BHJI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Gxl1uLLpILqe7vFB3wtk/IFQhr67kMdr91nN1CZoGPaFAKd0uqjzcP8mNUEIWxpD4Tm5SanCdi9z4GZNuU9t7x+UtdHlg4eHIrAm6wimfvFCnZ1ihIsTs/FyQ//p+GwKrs4tAKtW4cMIxRCWJPTdGhlThPXK91CipANW+QuEE44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fPE5M7gZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fPE5M7gZ"
Received: by smtp.kernel.org (Postfix)
	id 8F1C4C2BC86; Tue, 17 Mar 2026 14:11:29 +0000 (UTC)
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 840FDC19424;
	Tue, 17 Mar 2026 14:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 840FDC19424
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9A3CE41209
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773756687; bh=w338PgCVk9GxgZdmpR3EtnECPhyQBFeRDOC1OEmo8dI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fPE5M7gZyH45YKLgOT457vieRlbkX3dsulPps7u4QYWT8TatyNasWFtXdDDTZDeKX
	 o4mfOFD7m3X+/n1f71KAuBqkbUaEXY9GWelULuSfvUwkwy4UM3gPkJVMTlEfHxafUw
	 NdfQe33c9KEMmeJNhjhv9jRQ8GeJakX6r/qTbNt7a5KSngXbcNZaIhUvSEAqQJrC/g
	 ISx+lAgcPfoChTD7kR+WHGGi+P8yuHPpAat0fVVJCaas6Vx+Qni1gXuax+ivBF9xwV
	 HSsk0C24sfD4GlrUnwqFSWjpomH29WUxMn4/DLg6Y/u6MYPP8Z+UX4/KkKCTUOjBY+
	 Tx+ZwqUz7lF5g==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9A3CE41209;
	Tue, 17 Mar 2026 14:11:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Konstantin Ryabitsev <mricon@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 review available in master
In-Reply-To: <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
References: <20260227-imported-aromatic-guppy-ad3dca@lemur>
 <87tsuffj7h.fsf@trenco.lwn.net> <87h5qffikk.fsf@trenco.lwn.net>
 <20260316-quizzical-raccoon-of-refinement-d88fdb@lemur>
Date: Tue, 17 Mar 2026 08:11:26 -0600
Message-ID: <87qzpieeb5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <mricon@kernel.org> writes:

> On Mon, Mar 16, 2026 at 05:41:47PM -0600, Jonathan Corbet wrote:
>> > Konstantin Ryabitsev <mricon@kernel.org> writes:
>> >
>> >> Hi, all:
>> >>
>> >> TLDR: "b4 review" is a terminal UI that hopes to streamline a lot of
>> >> maintainer duties. A getting-started guide with screencasts is here:
>> >> https://b4.docs.kernel.org/en/latest/reviewer/getting-started.html
>> >
>> > So I've been playing with this a bit - fun stuff!  A few initial
>> > comments.
>> 
>> One more...  somehow it totally mangled the placement of the comments in
>> the first review I did with it.  See
>> 
>>   https://lore.kernel.org/all/177370220974.1754131.9642805524574261129.b4-review@b4/
>> 
>> ...and the followup with the intended placement restored.
>
> Failure is always an option! :)
>
> Thanks for both of these. Can you possibly share the review branch so I can
> see the tracking commit from there?

If I've done everything right, you'll find what you're looking for at

  git://git.lwn.net/linux.git b4/review/20260312-kernel-doc-use-a-c-lexical-tokenizer-for-transforms-0e0e9e143327

Thanks,

jon

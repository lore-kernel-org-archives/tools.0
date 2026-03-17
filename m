Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F221D618A
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 15:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773762897; cv=none; b=pExFS2rZfdQsal/LygxeRGNaqdOwGRt7UI9+r/o7xjuWevt0lMhmkBDu/Yyr8lA7SovkwNCM735JBqRjIEBNtiOrymPNSvhBoK2Y/XhLiHOUgrSFkVDpm05QCupIQ1j1yt+tu0tDJ0Bv4zkkTVF9ww4XpX+NzGrrvt9o/yknXsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773762897; c=relaxed/simple;
	bh=A4w/IlduKr5bmHL9Fh8Wc5s56KtTkTqgG4qP2+9cBf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FUF4IQ48pwHL2gVTwFMoKOHFpy+VSl5lVN27F27bZ6pJQzv/Xjvi3C/9b+lXcTNp+Ig8v5WxvSV67106xGl2lvsRDv2DEowOuKeffAiQGzqqvZt1J9fsihMrJSg3IOT9QJmkVPM/ywF+hpqfEUiKHaatSvD+h7pbxiRquWrCjWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oSjqTRTV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oSjqTRTV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2EA81A2E05
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 15:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B71CE5FC9A;
	Tue, 17 Mar 2026 15:54:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 843E610450603;
	Tue, 17 Mar 2026 16:54:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773762894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A4w/IlduKr5bmHL9Fh8Wc5s56KtTkTqgG4qP2+9cBf4=;
	b=oSjqTRTVZPLDevYIMH4FMWKyEzcRasM9tghFRO66FKiJUjNpc8R3660KcRnTaaaC560IPl
	/zEsUP4MK+yrFSeQm2SL48vz0R/aUsHAHUJw/EyXPdmYYukIkEIAFhlfyFk40O7W234mms
	FkisE4io5UivDRUaBKufe0zLP7BWGxyC+2YMzbwqxUDgaw23Ue8uHQZ7m0m9+KD2mGR05t
	sdGWw6OeQPm/AbCzuIUDlLpj5mHT2PGVBLmmyyaJYbTUTD8sD/qNYjbfY5pzhT6TMYyIYq
	puuH/JkSuOPAt0GqmR8hUJeSwr41qO5AI66TePatgRJQMRdza1GAk3SeW1X/cg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Chuck Lever <chucklever@gmail.com>,  Konstantin Ryabitsev
 <mricon@kernel.org>,  users@linux.kernel.org,  tools@linux.kernel.org
Subject: Re: Using "b4 prep" with Stacked Git
In-Reply-To: <CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
	(Paul Moore's message of "Tue, 17 Mar 2026 11:26:54 -0400")
References: <CAFMMQGt-Dc4DiSNUYR1mQfUBswP9bmjyXfcvuy6HO57rZ79fHA@mail.gmail.com>
	<CAHC9VhS7nBWxZ0=1c_ec=Lq+J0CqZUGbriu2i==X7FciSw0K2g@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 17 Mar 2026 16:54:52 +0100
Message-ID: <87tsuecuyb.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

>> A file-based strategy would solve all three problems cleanly. Something =
like:
>>
>> .git/b4-cover/<branchname>/subject
>> .git/b4-cover/<branchname>/body
>> .git/b4-cover/<branchname>/changelog
>> .git/b4-cover/<branchname>/recipients
>
> Fellow stacked git fan here.
>
> I do something very similar with my own scripts/tools, and if I could
> offer a suggestion based on my experience, you might want to consider
> some slight naming tweaks to support multiple cover letters in a
> single branch.

I've transitioned to b4 a few months ago, I really like the tool, but if
there is one key feature it lacks based on my very own workflow, it is
indeed the capability to stack series. I often have to manage several
series which depend on each other. b4 in this case requires one branch
per series which is painful to maintain.

A big +1 to whoever will propose such a stacked Git capability :-)

Cheers,
Miqu=C3=A8l

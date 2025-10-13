Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051DF34BA41
	for <tools@linux.kernel.org>; Mon, 13 Oct 2025 08:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345794; cv=none; b=JhtlKxy1ZPnH4Q5GRgzExKm9A0ujaAHjSoCB2B4uqVbJsZLfeXUTSb1X5C0APpRYcm4ajtB4V4cmdmIYBM6frYdN6+dE+z3Reg5pkgT2glz5UERJRRD0UCFQzf92J/sL64mXtk2xQadKf+Dhmt8RMyYvrzgklWvU9DAhlIygCTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345794; c=relaxed/simple;
	bh=Vto8Q6jWnJAOzXMaA65XJE6pwhuaa0HxizXt1t6yrRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJ+UczsgGlczYmK5UCyXPdge/Q6JMeFlszSFCoSVdHGmTEoAf7LDs8K+SZ0tsy0neTXj6Pkzufn1/4uiBlQBQKNxhhusmVAR70wXxyoBeL3Q/gPmecVQiyX0Oewjd1Sm3nn9M41G59VPTnIWGkREPZ+qIlKNOiHJvLu1qNkTJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=ubI01cdK; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="ubI01cdK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1760345790; bh=NaBZ3lTIHoxpf8SDTx8mgABJPYKuIX4AI6VNsDnj8bg=;
	h=From:Message-ID:From;
	b=ubI01cdKPeVW9hBg1X9IJovzk4i09KZidrd3kcaI5dAGghzPTr3/2XG660ErJ9iH9
	 8E58WeDviPqZ/fxF2q1cXUgQLJFflnZGuG3pKFVELft90XDDYzu8XYDsJaAR7H5aBb
	 cTrxQuc2gG/qE9pRhLJ2qB1KJfH7skmEYJZ82TzA=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 1E625C0916;
	Mon, 13 Oct 2025 10:56:30 +0200 (CEST)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 59D8uTNo001359;
	Mon, 13 Oct 2025 10:56:29 +0200
Date: Mon, 13 Oct 2025 10:56:29 +0200
From: Willy Tarreau <w@1wt.eu>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
        "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Mark Brown <broonie@kernel.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@kernel.org, tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251013085629.GK616@1wt.eu>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251011061351.GB23024@1wt.eu>
 <aOoyhUzNDgwiyl5s@finisterre.sirena.org.uk>
 <20251012232725.GC3938986@ziepe.ca>
 <d884ec6d-856c-4dce-b8bf-cb6116c87bcb@kernel.org>
 <CABgObfaL1Pki1QCgO_vb1Ex_1=RgVwzOmD8Z+q_KnPw3jHwBpQ@mail.gmail.com>
 <20251013084211.GH616@1wt.eu>
 <d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4f8e576-ee8c-4b74-a260-78289a26ec07@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Mon, Oct 13, 2025 at 10:48:40AM +0200, Jiri Slaby wrote:
> > Note that my understanding was that Linus wasn't against the use of
> > Link but against its use to point to the series while he hoped to find
> > extra information there, making it sort of a misleading use. That's
> > why I think that placing another tag for those who value it makes
> > sense and should not disturb him.
> 
> Let me cite from the thread :):
> > We're not adding garbage that I'm "supposed to ignore".

Yeah but he was already angry and pissed off when saying this, that
doesn't count. After all this time we all know how it is, and it's
human to overreact from time to time when having multiple people in
front of you asking for the same thing. Linus is a reasonable person
who values efficiency, and if something that costs him nothing can
improve his contributors' efficiency and quality, I don't think he
would reject it once he's convinced it really has a positive effect
overall. The point clearly is not to mix what he wants to visit
(e.g. a paper explaining the background for some work) and the link
to the submitted series.

Willy

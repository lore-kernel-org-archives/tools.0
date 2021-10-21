Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08A72
	for <tools@linux.kernel.org>; Thu, 21 Oct 2021 23:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IPWTyMvtBMx2AH4J7h3xFTz8pvw+9nRexzA63NR7WJI=; b=ArvQPkXA4N7C+FbAmVbW1NtBeg
	MvIJNOd43iZwUMSkBPZVgbJGRbxoHORSL3SolUnNF0XAafdDC8wCO60X/VCZvJzk88Rb22kCN+Pk1
	xvvxbxrXJwnXN9WMQFzjYSUb+c3Rv17UWFdlvzd6Pqu2u7wvlYtI0iMtf/Ox23dGdQCaXD4nVayrq
	lxOSk7kYWipcCLdxZGAJD9FBhZFjaAzKAMKr15T2wpKUPvDMHaDBOooirqgyEZ+t7V8Wj3zoS5fVR
	3OLM4lNc9F038dLlPEx62IdKTSQG9t0ni8+hMcVHHNGqCCveqoaDe2bOPPU2EAFf1MnH7KmmRFI8I
	xmKz6D5w==;
Received: from [2001:8b0:10b:1:780c:b7ae:aca2:4bff] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdhge-00BTWX-M2; Thu, 21 Oct 2021 23:41:29 +0000
Date: Fri, 22 Oct 2021 00:41:28 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Kees Cook <keescook@chromium.org>, tools@linux.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: injected body trailers
User-Agent: K-9 Mail for Android
In-Reply-To: <20211021233302.f6jw676z47g3mv5e@meerkat.local>
References: <202110211313.B5C5C61@keescook> <20211021204459.xd63t5xn24vktqf3@meerkat.local> <7786271477279d4fbf9292db1f6aede8428eb00d.camel@infradead.org> <20211021225731.qril46obyaywoqhw@meerkat.local> <6e943c88546b6924f81c3bc7eff29d771d97018a.camel@infradead.org> <20211021233302.f6jw676z47g3mv5e@meerkat.local>
Message-ID: <FA390090-E3C4-4718-8F1A-6876B02F999D@infradead.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html



On 22 October 2021 00:33:02 BST, Konstantin Ryabitsev <konstantin@linuxfou=
ndation=2Eorg> wrote:
>On Fri, Oct 22, 2021 at 12:00:43AM +0100, David Woodhouse wrote:
>> > thus making any message I touch pass DMARC verification=2E
>>=20
>>=20
>> Er=E2=80=A6 "thus making any message I *send* pass DMARC verification"=
=2E
>>=20
>> The Sender is the entity who sends the message=2E Who submits the messa=
ge
>> to the mail system for transport=2E The Sender in this case is Mailman,
>> and the DKIM signature correctly passes verification=2E
>>=20
>> All else is based on a fundamental misunderstanding of what the Sender:
>> and From: headers actually mean=2E
>
>David, I'm happy to argue whether this makes sense or not, but the fact o=
f the
>matter remains that DMARC specifically ignores the Sender: header, so any
>email gateway performing DMARC validation will mark messages sent by
>lists=2Einfradead=2Eorg as failing the check=2E Unfortunately, anti-phish=
ing
>policies at many companies increasingly quarantine or reject messages fai=
ling
>DMARC verification, so DMARC non-compliant mail will be increasingly not
>received by list subscribers=2E
>
>DMARC and mailing lists are not mutually incompatible, but to make it wor=
k
>correctly the list operators must either not touch the message bodies and=
 any
>pre-existing headers, or rewrite From: to be coming from the mailing list
>domain=2E In the context of patches, I would strongly argue that the form=
er is
>the only reasonable solution=2E

The only reasonable solution to the fact that DKIM/DMARC is fundamentally =
misdesigned, and failed to adopt any of the known workarounds that were bei=
ng floated during its inception? That like so many of the other email snake=
 oil "solutions", it required widescale changes in how email operates in th=
e real world, in order to make its false assumptions come true?

I would posit that another reasonable "solution" to that problem is *not* =
to pander to its stupidity, but instead just declare it "yet another bad id=
ea on the Internet" and ignore it=2E

But it's up to the owner of the individual mailing list=2E Nothing prevent=
s them from configuring it as DMARC demands=2E Unless they've forgotten the=
 list password, in which case I can reset it for them=2E

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

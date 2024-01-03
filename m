Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE410958
	for <tools@linux.kernel.org>; Wed,  3 Jan 2024 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eYRuaa/9"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cce70ad1a3so51490101fa.1
        for <tools@linux.kernel.org>; Tue, 02 Jan 2024 20:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1704256537; x=1704861337; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ7MX7Mkhe1UI4NfzB1cnG2mfBWBxrmXZVOZ14prCdg=;
        b=eYRuaa/9kmFB/GlcB5/wirVXjBxeqGsTciuNapcmTQGmwMeTjiTyIzN4QSebhhXo81
         IJcfEMXvTarT1jApJ2YwmmDkzswo8Kksfa/mVqiUQO0G7bwOhYf8NS541llqOHiwc2oB
         Apqm51HnFrvcA1oZceomL0WpM0zpru8nWOziA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704256537; x=1704861337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJ7MX7Mkhe1UI4NfzB1cnG2mfBWBxrmXZVOZ14prCdg=;
        b=HusgGSJqGbt+vltr9Qa/9qlRjI0w1KC4SWHd7dfBAgg24v349M89IC0rRLMFSZ55Zp
         o7uGfxkvJALVRRKYq2g44zvGCU/BUgHJrgBl5cz9Ez215onKcouE6Sjv+8v3uZ2Np5ri
         f/XKA2UyFI1ftrkRQ7HJIdYyeN/G1PndLsfmatl21jhMVvXVzJ7dFegVXLpqHCTiL2T+
         H51f7OXmptbR3haXTMtmuTTeFviILFM7aEju9gbabuVCosogDTB8UTlq5KPZHeUW2CNC
         NcELBgUO5haLuEBAabUG/9vmPNyo+qK7dTESsrg31WGp3YH3YcvAF8t4vhV1COJnvCo5
         lagQ==
X-Gm-Message-State: AOJu0YxP2Z78aZ4HqQ6m45ClWLbooAlHAIY2DCg0Altb0x8gmNTpeaT2
	koMQrVdXIJNfluE90uOOG6H2NPwEaULCyNnHrD1R1YpGvyFWQaHE
X-Google-Smtp-Source: AGHT+IGGffYR/1XVnMzFX35DfLYA2ntpNZ3SKretaIL4AEd73CWekOGATrzmrizMcQkYfRsqZOyzmA==
X-Received: by 2002:a2e:954b:0:b0:2cc:6016:d0c with SMTP id t11-20020a2e954b000000b002cc60160d0cmr7533106ljh.14.1704256537060;
        Tue, 02 Jan 2024 20:35:37 -0800 (PST)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id x31-20020a2ea99f000000b002cd0435c50bsm1169263ljq.72.2024.01.02.20.35.36
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 20:35:36 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e759ece35so7811489e87.3
        for <tools@linux.kernel.org>; Tue, 02 Jan 2024 20:35:36 -0800 (PST)
X-Received: by 2002:a05:6512:2204:b0:50e:7d8a:5e84 with SMTP id
 h4-20020a056512220400b0050e7d8a5e84mr5966605lfu.111.1704256535918; Tue, 02
 Jan 2024 20:35:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdVGqTM08DvsAjZ45wn1HTR0Grh8Ewj9q21pPwJmbok5hw@mail.gmail.com>
 <CAMuHMdVhyjjcyxMAGF8rAqmyqin=xjWH0fhhOjqbq7rH4f-RNw@mail.gmail.com>
 <20240102-axiomatic-gabby-whale-48d3bb@lemur> <CAMuHMdVtCfkLCb=d59XDELJO53jXJmo03iLcCwvMq54BFiUpFA@mail.gmail.com>
 <20240102-calculating-purple-dogfish-f4408c@lemur> <CAMuHMdW7+ENssXG4aim-Oa0T1pH-i5-YhVB9C+JaFoJjzuQK4g@mail.gmail.com>
 <20240102-debonair-beautiful-capybara-afced1@lemur> <20240103004415.42xndtocu2ggr2a5@pali>
In-Reply-To: <20240103004415.42xndtocu2ggr2a5@pali>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Tue, 2 Jan 2024 20:35:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com>
Message-ID: <CAHk-=wgZ-s0fHkxF-_7K5=WGW4G1ymom-nSHTFC+E-YAzPeTwQ@mail.gmail.com>
Subject: Re: b4 modifying Cc-tags
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users <users@linux.kernel.org>, 
	tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2 Jan 2024 at 16:44, Pali Roh=C3=A1r <pali@kernel.org> wrote:
>
> For a longer time I had experience that DKIM signature was enough to not
> mark emails as spam. But maybe spam filters changed and another
> technique (SPF or DMARC) is required now too? (I do not have issues with
> low traffic servers yet.)

DKIM with proper DMARC rules should be sufficient. At worst,
unmodified emails can be re-sent from other places, but that's kind of
the point of mailing lists, so that's actually an advantage.

But once you've set up DKIM/DMARC, doing SPF too should be so trivial
that it becomes a "why not just that too?" issue.

I note that the kernel.org DKIM setup seems to use "c=3Drelaxed/simple=E2=
=80=9D,
which seems bogus. I think it should use "c=3Drelaxed/relaxed" because
we just know whitespace is too fragile.

At least that seems to be the case with your email (which
mx.google.com reports as

   dkim=3Dneutral (body hash did not verify)

according to the headers I see).

Konstantin, is that c=3Drelaxed/simple intentional?

          Linus

Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD912C1AF
	for <tools@linux.kernel.org>; Fri, 22 Dec 2023 18:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RarOlbrz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3369ccb539aso337962f8f.3
        for <tools@linux.kernel.org>; Fri, 22 Dec 2023 10:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703271157; x=1703875957; darn=linux.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VUgd5KXm4ZUP6yOuquBfQaehSejG8nSOmU5pMsgjdd8=;
        b=RarOlbrzZIvESg6OvYUwi2ghYcpIcL0SXHqW7jFfDXKY4pAj82LtIHXl1g8fOoFWNR
         zM2t6teyGmTj+dWvDH34RCB6I+iFs+zyRlxmXHnIfZzGfF7TTi+ku9E/iiyihzLMf9sz
         VJKKXLa/wgrMYo3Fb60raTRIkbYyrkcb+z5hALW/B9yqJ6u4i+MVJ/qlzl72Jz+KZBaw
         1YPaLxsJ+AsRyB/Wgn1uFw0WouS0PNRSxL0TLw77H+fE9jVk3hpHnT7oajJ9QrDSjfrS
         n69TRNWOSgJmkCC1QWVkmS05sHt4JViVI5eCO8MMyF4vP8gyhnuZbnmkMQlHmooVvBym
         Ce2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703271157; x=1703875957;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VUgd5KXm4ZUP6yOuquBfQaehSejG8nSOmU5pMsgjdd8=;
        b=lI8L8yTBHhQiOrL5nMEojugRxltw8Ad8jgpMcgGStD/0eLVVrtvj1jd1lh61utjJXM
         J8hL2sV/DW/TYlzVYeYgrbl00pze+qi19w1QCU2OgWAMtau5F0FNyq1m+1PDM+m5D8ZJ
         7Z1O8XM2tiuf/+3wESk/e8kqIw6rz91MNq6sPawvnZUzvf+ewC685iB7bNk0ftqLai7X
         hi3mZpTWS317yKWnoUYwXlbAutCjod8VlINGyV2O/fegqvjbkfwbt2Xrg7g/GuDs+HY1
         JIvKdrak51aW89e085SrbPDTQlBlvDFlEUhnSSal1dVxneCQW9xwZNEnBuZp670+lKP3
         ld2w==
X-Gm-Message-State: AOJu0YyprKe5aoM/jD9i0WDCiNYOjlnUhvM1WdUx4FQXTpzaVBLWTO4u
	+016EPQBP//tM8zDDklXF25MLdD1nBxSm81KL8aHCIjo7Yo=
X-Google-Smtp-Source: AGHT+IGC55E9pQfyWfQa2biZmFXgB7JYvGasfodrlBvFRRuad9WqLEhOfNaG976iI9ITKp1Ifap+4g==
X-Received: by 2002:a5d:66d1:0:b0:336:8d32:1f5b with SMTP id k17-20020a5d66d1000000b003368d321f5bmr1055110wrw.103.1703271157368;
        Fri, 22 Dec 2023 10:52:37 -0800 (PST)
Received: from ?IPv6:2804:30c:1668:b300:8fcd:588d:fb77:ed04? ([2804:30c:1668:b300:8fcd:588d:fb77:ed04])
        by smtp.gmail.com with ESMTPSA id a16-20020a056000101000b003366a9cb0d1sm4883253wrx.92.2023.12.22.10.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 10:52:37 -0800 (PST)
Message-ID: <f5c38763b4d42cfafdaac24d83ec18b81dfc073a.camel@suse.com>
Subject: Re: [PATCH RESEND v4 0/3] livepatch: Move modules to selftests and
 add a new test
From: Marcos Paulo de Souza <mpdesouza@suse.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Date: Fri, 22 Dec 2023 15:52:29 -0300
In-Reply-To: <20231222-horned-caiman-of-freedom-3fec0a@lemur>
References: <20231220-send-lp-kselftests-v4-0-3458ec1b1a38@suse.com>
	 <55b717dba239f3bedf0da7e25925e390a63459f5.camel@suse.com>
	 <20231222-horned-caiman-of-freedom-3fec0a@lemur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0

On Fri, 2023-12-22 at 13:40 -0500, Konstantin Ryabitsev wrote:
> On Thu, Dec 21, 2023 at 09:17:04AM -0300, Marcos Paulo de Souza
> wrote:
> > To clarify: this is not a resend, this is the v4 that people were
> > waiting for. I made a mistake with b4 tool, that first I sent the
> > email
> > just to myself, for testing, and it bumped the version to v5, but I
> > asked it to "resend" the v4, but it ended up adding the "RESEND" to
> > the
> > series.
>=20
> Thank you for sharing that. The expected workflow here would be to
> use
> --reflect first if you wanted to send something to yourself. Can you
> think of
> a way that this experience can be less unexpected?

So my usecase was that I first sent the patches locally to my
colleagues, so I used
	b4 send --no-trailer-to-cc --to
colleague1@suse.com,colleague2@suse.com

Well, maybe adding a confirmation for the user that the version will be
bumped. A new flag could also be created b4 send --keep-version to send
without bumping, thus avoiding the prompt?

Is this too convoluted?

Thanks!
  Marcos

>=20
> (Dropping everyone else from cc's and adding the tools list)
>=20
> -K


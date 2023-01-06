Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5447E8
	for <tools@linux.kernel.org>; Fri,  6 Jan 2023 18:53:37 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id c7so2774187qtw.8
        for <tools@linux.kernel.org>; Fri, 06 Jan 2023 10:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Zfn7viPISgASm8j0I7d0lHYK1+iHDbPNU4EZXycVKw=;
        b=C895Fznu2QqsISg3pgE6FT8apE3mrF1l9FfQkbR23tVPLaPtpTAGO8QKyFy0YzYDdz
         jUSGY6uh24uhMjrrHn6Q7GouTmacFriJ/oe7jtE7M3Qn/XQctSaIfcoiXPQGEM+m+a73
         R31jWjGGKHL7BJ/kCRjvsPhUfliztri2GCDGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Zfn7viPISgASm8j0I7d0lHYK1+iHDbPNU4EZXycVKw=;
        b=UST8L2IEtfxrDCpjg5l/fAIeqV4EwMeR2FM3sqy6v/7JOGJwzfV7rOnOCEnlTWpikA
         t0Qk/375MBPt9axx64zSzgkDoQJvdv9ieS7tuuj5BlDESE0y824cYBBxohA9J+hV6ErV
         wGeZb7eXrAVwPRXgJ9n8LpEmCSUPfjLgqzCx5x8kxa+CDIpyn4QW8Zo3fxY+FNpmnVYq
         ircXmDg3DatLZeMTxUe605WL3pbKpckAcqbSQfDlpFODXAEjZBo8Ok9qYZRgmEW3kxys
         jFq+u+C6NOnSBz7Z4x1tc08gK1+nc6+TKNYbqCIKB9Q6/8jhMlzfcVB0ODU8Sr5gwScP
         2xcQ==
X-Gm-Message-State: AFqh2krVhA9pppGiT8ti/cQHh6OKg/C6U8hfsZ2Qq0xS7+aWW9LIyxOo
	SnywIJNaYtA1APR4GYUMxZ0p32UD9t1c0cOG
X-Google-Smtp-Source: AMrXdXsv5CGsHssYQObIMdJkndzHjquVnEYcgqzsfUz6woAO5dE/QB+Fcc0e6pr52J3SO0Dm/2+Y7A==
X-Received: by 2002:ac8:5207:0:b0:3a8:177a:665f with SMTP id r7-20020ac85207000000b003a8177a665fmr72100360qtn.50.1673031216445;
        Fri, 06 Jan 2023 10:53:36 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id r20-20020ac85e94000000b003a7f597dc60sm852779qtx.72.2023.01.06.10.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 10:53:36 -0800 (PST)
Date: Fri, 6 Jan 2023 13:53:34 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: b4 am doesn't fetch all recipient headers
Message-ID: <20230106185334.jyefhjur6yjn4w3e@meerkat.local>
References: <Y7hLWvgqqJCK7+yM@sirena.org.uk>
 <20230106170038.tbdihuu667upvqnr@meerkat.local>
 <Y7hWOEoqPsF+Wrtx@sirena.org.uk>
 <20230106173237.tpsdbdnzjfbgulcg@meerkat.local>
 <Y7hb17cciwrXm4E1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y7hb17cciwrXm4E1@sirena.org.uk>

On Fri, Jan 06, 2023 at 05:35:19PM +0000, Mark Brown wrote:
> > What if I give you:
> 
> >     b4 mbox --refetch mbox
> 
> > This will refetch all the messages in the mbox with their original headers?
> 
> Yes, that'd also work well I think.

It's in master if you want to try it out.

-K

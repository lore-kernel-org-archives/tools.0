Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E12C8B
	for <tools@linux.kernel.org>; Mon, 25 Oct 2021 21:09:16 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id g17so11568173qtk.8
        for <tools@linux.kernel.org>; Mon, 25 Oct 2021 14:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=br74kPOfegzruT3MCB/OsSS4RfOqzXAUZbUZvmq428o=;
        b=Y3Qia6w/qoeEIO2a30/TRJxj/JJdqUzU+ROhJQ0uV/vLxgZgBe+zaAwYg0TqrUPsMc
         FwECR5eF3SIqoQo/E+I+9UrlGjf9LVIH22lKY8zkl6pklTxwQDsl8Cvk46jwGB+25WOs
         OLKXSmsmbDbKNFTIRDQpa18gLFAgyDEBalt0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=br74kPOfegzruT3MCB/OsSS4RfOqzXAUZbUZvmq428o=;
        b=IUd+J/vW5GlPGCGA0dwuu94tjQTof6Njf1Xq91sdx38T8F+k2e669SJJjQkE8LiKex
         pqStOUFyM0bN6LSan5hbi6iBYS/1Tn6xnWL99SjbQff4ZCML97C+/wVS9uwW3XA93GRj
         fEpLBis9BdJ5Eb5cKMXEtGY1tZ2a50kujHpLZyEFjogIMd/T8Lzz9ZYiA3a/wTCQOKET
         JixQ3nBc0rwSkQr5TqL6z9Y8s5rMA0tdE3yBHACpao+CfiAFP5GepRSmW1hJCH/BvWfz
         3ItLYA8fh+tYsNv/m/JtOSk2mWKjY143Aet1pjVeBzaO7O4T4rRFswbLBW/dxM0m7Lrh
         NiTg==
X-Gm-Message-State: AOAM533ehyCVQoYNJqTxUPSKIBg0ksUVpjDEC0fLqIqXJysJmHUpYdi1
	yGLJ7M5cBoRkNV24wSoim6fQMZgKsW4paA==
X-Google-Smtp-Source: ABdhPJxjiC4YXDuh/pXpIfAwoL27KrRDByInebJPCAcF2NB9Z70TA2C/q4zQSrWv4U4LCtL8CDcsPw==
X-Received: by 2002:ac8:7fcf:: with SMTP id b15mr19849258qtk.363.1635196155798;
        Mon, 25 Oct 2021 14:09:15 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id w185sm9412006qkd.30.2021.10.25.14.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 14:09:15 -0700 (PDT)
Date: Mon, 25 Oct 2021 17:09:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4: shazam and ty flag changes
Message-ID: <20211025210914.63j2q5cuslxwekwg@meerkat.local>
References: <20211020151043.dwbug4k5yeifqbhe@meerkat.local>
 <YXcHfu5mTWkiHY6L@sirena.org.uk>
 <YXcMYRe5fsHlYIeL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YXcMYRe5fsHlYIeL@sirena.org.uk>

On Mon, Oct 25, 2021 at 08:58:25PM +0100, Mark Brown wrote:
> Ah, now I try again after setting up a [smtp] block I'm seeing the same
> error with git send-email, though not with the same parameters specified
> in a [smtp] block instead which is confusing me no end.  Both programs
> connect to port 587 and does STARTTLS as I'd expect before reporting an
> authentication failure.  I'll have another poke later, I can't spot
> any reason why the configuration that works with [smtp] won't work with
> [sendemail] - the parameter names appear to match.

I'm happy to test it out if you send me your [sendemail] and [smtp] blocks
with your credentials replaced by X's.

-K

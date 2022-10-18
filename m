Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCB4A24
	for <tools@linux.kernel.org>; Tue, 18 Oct 2022 20:37:53 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id s3so10459813qtn.12
        for <tools@linux.kernel.org>; Tue, 18 Oct 2022 13:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5vlEfNKPSzphnDkv9d0RVPKCp20AE2nvJobkOjmr+9U=;
        b=HJM6mKohPRDDfiuAKWXhEcoEezY2wGy3T2+iHXebNOsPnd0hC3HYp/QmFeqbC52uKR
         FcrSyI2RkgAbUET1QrLbUjNxpMLeFgz6cZuBmGoV7BITFeNsH0Ov6GUHablETnTYyHQ5
         vrfwWXtoHwIUiXpSLzLGRzYY6HzchEPzc2pZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5vlEfNKPSzphnDkv9d0RVPKCp20AE2nvJobkOjmr+9U=;
        b=IKTfZ1XuDAwg+ZJFCmaZrOsLbvLKnVlqFDr3Q/1YaWFruVue999AEA+HPYKEXZYZ1f
         4BkJq4iV2LGfMri7LGB8D6ycEEzRNuv8qgK4O7sUH9IfzrsALTwmhARuCxuvV4MC6VF1
         vXIi9q77XSdC31xFghrADF7cwSjsov7kmsFANhzocuzCfwesQajtKmSyoprjOumdMiGG
         rNCobQr88DFfeSDO1J0lbEdJpuiUovegWrJtHDb7/20W5bWtqEbfXrwpeuOMobeZRPEC
         paeT4qpawAyxa1pv1eZHS2Tl2Py5IqzlmPeUsmya233uX4k+vqD/wmRuqDTcjb3uUKq7
         JWVw==
X-Gm-Message-State: ACrzQf1Y6Dwk55Mhr689dSA0nQfAPWx/8A8a3YOFUoU9eOHHLXbIxYSS
	XdlKTmdB1go5EReHGpQdkoemYjrHkgpzHw==
X-Google-Smtp-Source: AMsMyM4bxXjCUmAU3latiTtiDxIH80JtLrYJWa61P3qWfMtXuL4yGnOTJkN9JTktUMpN3/AOH9LYtg==
X-Received: by 2002:a05:622a:1a9f:b0:39c:ae32:9f7f with SMTP id s31-20020a05622a1a9f00b0039cae329f7fmr3823443qtc.80.1666125472250;
        Tue, 18 Oct 2022 13:37:52 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id a21-20020a05620a067500b006e54251993esm2934180qkh.97.2022.10.18.13.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 13:37:51 -0700 (PDT)
Date: Tue, 18 Oct 2022 16:37:49 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: Maxime Ripard <maxime@cerno.tech>, users@linux.kernel.org,
	tools@linux.kernel.org
Subject: Re: b4 bugs / future improvements
Message-ID: <20221018203749.o4i5h2qt6artzezx@nitro.local>
References: <20221018153620.tyuedbldi2ofbe2x@houat>
 <20221018201804.na5x7lohm4yszg5h@nitro.local>
 <Y08MuItOLxqpBr+/@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y08MuItOLxqpBr+/@sirena.org.uk>

On Tue, Oct 18, 2022 at 09:29:44PM +0100, Mark Brown wrote:
> > >    - It's a bit tedious to do. One needs to rebase and then edit the
> > >      cover letter by hand without b4 being involved. I don't think doing
> > >      the rebase interface all over again is reasonable, but maybe we
> > >      could add a subcommand to set a new base?
> 
> > Interesting. I'm not sure I fully understand the problem, but then all my
> > rebase tests were all very simple cases of running "git rebase <newtag>"
> 
> > Is there a reason why you have to manually edit the cover letter after a
> > rebase?
> 
> If you're doing an inter-version changelog it's common to say something
> like "rebased against foo" in there.  It's a bit clearer about things
> than base-commit.

No, I don't think that's what Maxime means -- "rebased against foo" can be
done using "b4 prep --edit-cover". I think there's two things going on:

1. he's using a different cover strategy that requires base-branch tracking
2. he's rebasing on a different branch, as opposed to a newer tag within the
   same branch

That would indeed be as cumbersome as described (and why I'm using the "cover
letter as an empty commit at the start of the series" strategy as the
default).

Maxime, is that correct? I assume you're using "tip-commit"?

-K

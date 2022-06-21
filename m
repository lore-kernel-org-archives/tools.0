Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D347499
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 21:23:43 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id s124so18769839oia.0
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 14:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yi2Fw94x275dx0V3SVwKrDCoeNQyDSvPMpT3IV1q1vU=;
        b=shXIquhtHpcpLGhKDDPQMmfoMR27epBUSb1/nHftdG9UPtoNMJjbrNbtBmmKLI9RhL
         vCOx3oSnNZxclQjlxoIIxPa0NuGKAwyq7PVYs07Mr22S3wMGQUQPUapMfFXBMjKTRE2h
         6hlI/TpFQ22CbWB+OzDfWSL1stPGzwOfCsjzoltpNALGObl5Nm93VmaC66RjtsA0/wbM
         j9EQOyAvleJlEQaKPuvFq0DvoBuro79pcZ35i8IA+5v5mnkMTYd7g3r3AMsMZN9MEVaD
         7YibVyi1phkH5ETMVJtxv8Ns0IGP8TTk7RSPil31IwP39QEJq9g+9L4dhLQ13g3sM/WF
         GSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yi2Fw94x275dx0V3SVwKrDCoeNQyDSvPMpT3IV1q1vU=;
        b=KrFeHHx39nxKfmmkpllKEk1EWdRlRe+3SEtDGOwp/qU1jkZYHXaWqPxTvlwbqUQPG1
         j+QwVYKLQosuhEbbxnCoW0W6jc1RL6/JsLfR7pYfqfiMiL2c+Ij74UxrpVPGn5KADzsr
         AOqDAipOvtP8FILGam40wR2C8WjcxT2MthAhaiNI5ENjcyLepsUp7WMPX8PZBSjhkT4a
         ryrQjrueBOTfc4yZT12wZBH9JVc8cmk55K1Uf56j3Uc/3uLvRuEn9htJCgMXq5uT9fue
         VVpD0DfsawVuVujTqK0IlNdL2vY3hr9IRqRDuyr0BSQMKzEHOvP5Two7KMnKUyZK3jdk
         s4ag==
X-Gm-Message-State: AJIora8Q5xWHqDGTtVYUeJQTsecgdKPwVpDfNPP831BgpT5crBcVTpvI
	+xQIXiGvz29GBqSgItNt66UPHA==
X-Google-Smtp-Source: AGRyM1sPZ8gbRs8LNVZ7thJ/4W/d9760OkOKSqodJK8SKDBWfWLNU5XhSj/o8EemaWfRO38iXdYrdA==
X-Received: by 2002:aca:c282:0:b0:32f:546:61ff with SMTP id s124-20020acac282000000b0032f054661ffmr46948oif.39.1655846622277;
        Tue, 21 Jun 2022 14:23:42 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e133-20020aca378b000000b0032e3cca8561sm9912192oia.21.2022.06.21.14.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 14:23:41 -0700 (PDT)
Date: Tue, 21 Jun 2022 14:25:47 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <YrI3W46GUS/Dap5J@ripper>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
 <20220621182953.p5asczznnz3pn6dl@meerkat.local>
 <YrIR2v7GdC3qIt2E@zx2c4.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrIR2v7GdC3qIt2E@zx2c4.com>

On Tue 21 Jun 11:45 PDT 2022, Jason A. Donenfeld wrote:

> Hi Konstantin,
> 
> On Tue, Jun 21, 2022 at 02:29:53PM -0400, Konstantin Ryabitsev wrote:
> > If there is someone who is willing to compile a definitive list of "Linux
> > Kernel commit do's and dont's", then I'll happily stick to that.
> 
> I dunno about a "definitive list". But it seems like a lot of
> conventions get solidified by way of tools that are ironed out over
> time. For example, every time a code style discussion comes up, Joe
> Perches arrives on the scene to make sure checkpatch.pl is current. And
> now the clang-format file is starting to also accumulate collective
> preferences. It seems like b4 is pretty widely used and will eventually
> serve a similar purpose if it doesn't already do so.
> 
> Anyway, in lieu of a complete and thorough list of all of the things, it
> seems like in the last week or so we at least have two things that can
> be be reflected in the tooling:
> 
> - Don't add `Link:` if the URL hasn't been hand selected as being
>   particularly relevant; the lkml patch email alone doesn't cut it. This
>   suggests that automatically adding `Link:` is invariably wrong, since
>   automatic != "hand selected", so maybe there's no point in
>   `-l,--add-link`, and you can just remove that option.
> 

FWIW I find it very helpful to have the lore-Link in patches, as that
allow me to quickly find and share a pointer to already landed
patch/patchset - in particular when the recipient doesn't have
linux-next synced and checked out locally.

And I don't mind there being multiple Link: tags to different resources,
as the various automation use cases I've run into have been easily
solved by just filtering the tags by domain...

Regards,
Bjorn

> - Don't reorder `Signed-off-by:`. The simplest thing to do would be to
>   remove the `trailer-order` option all together. But some people do
>   want to sort the trailers (within each S-o-b segment) for aesthetic
>   purposes. So if you don't want to take that away from them, maybe
>   S-o-b needs to be unconditionally special-cased so that it forms a
>   reorder barrier.
> 
>   #define sob(name) do { smp_mb(); __sob(name); } while (0)
> 
> Jason
> 

Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE117483
	for <tools@linux.kernel.org>; Tue, 21 Jun 2022 18:29:57 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id o43so21660355qvo.4
        for <tools@linux.kernel.org>; Tue, 21 Jun 2022 11:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/slWNEfwdQqnAiaxVJDM1kTYiUqVoR6MZiK5rHAfky4=;
        b=Spqi5xN8SrnGs+F/dFlImXNZV6dL/DPfbpGzRTzo9h6QKe3GiO0JaUnQ258FTgVMKA
         zzEkYKq9kuc6SOF7GwQRKQ6PoDNGgvGS8YMZ+i7cs8lyqy+jnMB83biTBshhQL6MTXiS
         DRX9Vf4jiSsnoT4yKYv7n9SrB7yjvfR6kh1BM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/slWNEfwdQqnAiaxVJDM1kTYiUqVoR6MZiK5rHAfky4=;
        b=5AJJ1PkII4G2CthKeRtclYjDfopGOAB3SPtvzux5ccvdk9lUiQ0GDT+ZGuAn2bQQd9
         Qi/wsYgeAVVCPfBhth1/tsWpySxW8mvh9Ef4TVxA0M0qfPGakII0Af4FbZ3wOH/3GXY0
         VWD8HM+vQUNUxGs1hyfniilaSGryghM/LxJDaRy/Okvwf30Arrm8ed/qbnPel81ivIPS
         ENuGtJp0afmLk/qjYAF9H8Ngpx+f+ijC1H35gyWKUdHU6cOp1jfH9HET23ngfi4wBChN
         qodli/5A0GGkpsaXBg/qSJyZ/+hHFTsLFlPCNJQhRSbsghQ7As17h2ZfNi236U/csXu3
         LIWQ==
X-Gm-Message-State: AJIora/Mr507Z+Gfb8x4jKTixSRhAiV36aLplENKa4N/LTVRLaLWDj47
	wuO/YWAx5shMPzymExEZSv0bEQ==
X-Google-Smtp-Source: AGRyM1sZ91YS3cZotJlfwyqBChN/j/BdPNI/2iT1ngnMYzQ8axdlFI9bVqI3ve6q66X7CeGgD05JOA==
X-Received: by 2002:ad4:5fce:0:b0:470:3da8:bc33 with SMTP id jq14-20020ad45fce000000b004703da8bc33mr11914569qvb.38.1655836196843;
        Tue, 21 Jun 2022 11:29:56 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id p6-20020a37bf06000000b006a6a4b43c01sm13868962qkf.38.2022.06.21.11.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 11:29:56 -0700 (PDT)
Date: Tue, 21 Jun 2022 14:29:53 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4-0.9.0 available
Message-ID: <20220621182953.p5asczznnz3pn6dl@meerkat.local>
References: <20220617190153.tvi5lkzlvemeqou5@meerkat.local>
 <CAMuHMdV4AHH1TM6xf26MP0-dUQ0-fB+62GeeuVuth9pgWgdu7Q@mail.gmail.com>
 <20220621152903.czivp7fdn6me775i@meerkat.local>
 <CAMuHMdWz8=Zr8hnXNGBZVfe70F8oVdK670Z41=Dtib0GMDgAug@mail.gmail.com>
 <CAHk-=wiQzp+aurcmj15=LAa2ntvRZH0Ee2dn-PLjcFpmRE6Jcw@mail.gmail.com>
 <CAHmME9p+zRErOsvA1zC=kTHtpYD_sGjFxVsj0pMwteAp4dCdjQ@mail.gmail.com>
 <20220621165953.z25hwos7gom6bp6s@meerkat.local>
 <YrIEnmt5vDMcbOiG@zx2c4.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YrIEnmt5vDMcbOiG@zx2c4.com>

On Tue, Jun 21, 2022 at 07:49:18PM +0200, Jason A. Donenfeld wrote:
> IMO, you should remove both the "sort S-o-b into meaninglessness" and
> the "add a useless Link: trailer that wastes my time when I middle click
> it" options, so that it's harder to make these mistakes.

I mean, I'm happy to make any changes, but I implemented these in the first
place as a response to requests or established practices. Some maintainers do
very much like to sort their trailers, and others like to link to the list
origins of the patch.

If there is someone who is willing to compile a definitive list of "Linux
Kernel commit do's and dont's", then I'll happily stick to that.

For now, the default operation is already exactly as you ask -- we neither
sort the trailers nor add the link unless both of these are explicitly
requested.

-K

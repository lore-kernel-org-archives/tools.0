Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B537B
	for <tools@linux.kernel.org>; Wed, 24 Aug 2022 14:26:02 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id g14so3273711qto.11
        for <tools@linux.kernel.org>; Wed, 24 Aug 2022 07:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=hmMDazwlTNEyocOaS4IG/SvcSgOyMIB2jEJ++P/ssVY=;
        b=JB+R9pj/Gta8qsug1plVo3GDM++WSVdk6fWJQF0ujAwEKYqeak9NrmNqR11UxQLECE
         x0nskecyTWHYW0NVdoxU4Ic56ZyElQnVtJ5TlTQRGmjbIuC7JOW7Y5znzR62jGGCWhhR
         ClYCFCXdzSjdgE8GxllXvx4FPYKxsIyStpQbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=hmMDazwlTNEyocOaS4IG/SvcSgOyMIB2jEJ++P/ssVY=;
        b=BTdGv9OENLsyNRobY9w522/XuCpyqTPHq/qELTLq60z07IP1eN3OYiI7UKaZoy9aJV
         M33hL9FG2Hh3zRRHaA64MWx/TJl5nYY0NBBM1wpmlxvVhNQ1c01IRM0xQNU+w6ZEgLdd
         8qjD4LRKqHVtivjeTUqaV0EfpojH3NaBl9WDilfDjQU4xNuDHYlgFDQhOZnte3sY/x0p
         f3H3Kw/gdt1181fM3TXjrK2hmTKWLzYMU/jrXWDV4ZuBeHgtaNC/FQP81afPixSsHwBw
         h5+FllDjWQdn1NVmGyapf+olSpWud8//jifWgvgOTf3is4IZVUt0LUj561MWDFRLXa71
         5Xyg==
X-Gm-Message-State: ACgBeo2PTyWPi4b2mlQxCuhUylEM8YEiq5XM92z2QaWF23JudyVjZD6F
	DMKXBokzcnpNeF7bYMsChnT60w==
X-Google-Smtp-Source: AA6agR4/hRtDXfY2JRlYMpHSEZ7j/X25svSg9NZ8k2l4eecEReMqHWKCK46IQ/cb3mJBq6GqQVyjRw==
X-Received: by 2002:a05:622a:40c7:b0:344:bf95:c03e with SMTP id ch7-20020a05622a40c700b00344bf95c03emr12313424qtb.589.1661351161821;
        Wed, 24 Aug 2022 07:26:01 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id z4-20020ac875c4000000b0034454d0c8f3sm12608716qtq.93.2022.08.24.07.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 07:26:01 -0700 (PDT)
Date: Wed, 24 Aug 2022 10:25:59 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Philippe Blain <levraiphilippeblain@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH b4] setup.py: bump python_requires to 3.8
Message-ID: <20220824142559.wjoeshhh7bpbxksg@meerkat.local>
References: <20220824030526.49825-1-levraiphilippeblain@gmail.com>
 <166134967564.440655.17645159218754031307.b4-ty@linuxfoundation.org>
 <8b5987bc-0969-c8a5-51f6-3669b2ff8881@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8b5987bc-0969-c8a5-51f6-3669b2ff8881@gmail.com>

On Wed, Aug 24, 2022 at 10:10:35AM -0400, Philippe Blain wrote:
> > Applied, thanks!
> > 
> > [1/1] setup.py: bump python_requires to 3.8
> >       commit: 65ba7a9d3ee989035a875e7c108f1733e92c7ea0
> > 
> > Best regards,
> > 
> 
> Super! Would it make sense to merge it to stable-0.9.y and create 
> a new release ? This would avoid the problem for people upgrading or installing
> on 3.6 or 3.7, without waiting for 0.10.0 to be released.

Correct, I did apply it to stable-0.9.y (pushed now). I should have noticed
the incompatible option, but on the other hand 3.6 is EOL since December last
year, so everyone needs to move on to something newer anyway.

I'll see if there are some other backports worth doing for 0.9 and then
release a 0.9.1.

Thanks,
-K

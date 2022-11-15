Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15848ABA
	for <tools@linux.kernel.org>; Tue, 15 Nov 2022 20:28:54 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x21so10363457qkj.0
        for <tools@linux.kernel.org>; Tue, 15 Nov 2022 12:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9o53LdBMPyYS3l4x4yTasECwRnlOm1P4KZ0YFsnIV4Q=;
        b=JS1DvjQiIum1TtG2/TkU834SyWzdYxY4FQJJ9Ne9yX3Fj52C2unF6eR79dT9D4TNeR
         AsdLmZzldlcuLJ8JLabfXAFmt1THuLpzKDOsGX17BLKh5LAPhIcPeVS1ZfBArN6egQks
         WWruoywVGK87WgQOpiucl1VApAWB7TYqOVFpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9o53LdBMPyYS3l4x4yTasECwRnlOm1P4KZ0YFsnIV4Q=;
        b=VeqIYThxDQLNv8HxBKQJ2UzJSBPd3XEnhqlUZjC43N87pWG/AHufOstIGiQC9JU96j
         rPQ7QfoXAlaUEjtW2gKKZ0FooMWlStem8yYDUJgmjuu88uqdpun7Hf7oaV9Llvu6dNkG
         s2wgR6jYCEy9Aa9bvQy0bbBdqbVsx6DxG++GZ5lq4H9cZ7I0mUHeD+Vx+xQ+eDLzKyZa
         pJIKB/bTF3kWz0zKyjgDuauuvwk1tYrUgcRYV8rTWPuXKF0vIaYFA9LjgcYZl5DNOVW8
         FQ2hFipk4okLwIy3xiRwnhMWADLGlZ69ZkjjWgBqfH0lo61bsHgk+5BOVLdAUg+5JdTI
         FcwA==
X-Gm-Message-State: ANoB5pljWOhHvwoXugJZcL/KDIRbA7LT6RszzUZeQyYi/CuoisvDPpj3
	dFAHm5I623vGGSL8TGEshSmIlg==
X-Google-Smtp-Source: AA0mqf7p3yabfikZSoaegk6VlKv57FxmjXrI96AJrKTPDdd/xZEye30gdTxpWKs6Zs1gvgTqyOHmbA==
X-Received: by 2002:a05:620a:705:b0:6ce:df33:d684 with SMTP id 5-20020a05620a070500b006cedf33d684mr16464444qkc.544.1668544133686;
        Tue, 15 Nov 2022 12:28:53 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id fp1-20020a05622a508100b0039ee562799csm7645742qtb.59.2022.11.15.12.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 12:28:53 -0800 (PST)
Date: Tue, 15 Nov 2022 15:28:51 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, tools@linux.kernel.org,
	users@linux.kernel.org
Subject: Re: b4 patch subject issue
Message-ID: <20221115202851.swjefy4auefrubrj@nitro.local>
References: <Y3Pz9Y9Mn1FtnqR1@mail.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y3Pz9Y9Mn1FtnqR1@mail.local>

On Tue, Nov 15, 2022 at 09:17:57PM +0100, Alexandre Belloni wrote:
> Hello Konstantin,
> 
> I found a small issue in how b4 handles path subjects:
> 
> linux$ b4 shazam -tsl 5640233.DvuYhMxLoT@kreacher

...

>   [PATCH v2 3/5] rtc: rtc-cmos: Eliminate forward declarations of some functions
>     + Reviewed-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
>     + Tested-by: Zhang Rui <rui.zhang@intel.com> (✓ DKIM/intel.com)
>     + Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com> (✓ DKIM/intel.com)
>     + Link: https://lore.kernel.org/r/13157911.uLZWGnKmhe@kreacher
>     + Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

If you look at that message (via the link above), you'll see that it has an
in-body "Subject:" line:

	From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
	Subject: [PATCH] rtc: rtc-cmos: 

I have no idea how it ended up there (you'd have to ask Rafael), but git will
always use the in-body "Subject:" header when it sees it.

Best regards,
Konstantin

Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940C829A9
	for <tools@linux.kernel.org>; Wed, 11 Jan 2023 18:38:41 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id z12so14463274qtv.5
        for <tools@linux.kernel.org>; Wed, 11 Jan 2023 10:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFCg/kGqh0a3u5/dny6XtVlAj0r19ffszhJJ/zIz0fU=;
        b=Untdl4KJt0sqaTmIYiL5QxTg8EfPrEcp6e1Q7LtjOoEmVLyLOtUbXUP4eyfL6mlbYn
         ODvoG5IvcQDCai/rnItX+YWTf9FsH82gW2HhXZz4PhlmzH0daxcPKlgk1g0zsZ1xy6ce
         b9kMKa29Aiy0OjNMAsIv4nWYnW5g8a1AwrkJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFCg/kGqh0a3u5/dny6XtVlAj0r19ffszhJJ/zIz0fU=;
        b=pyquoIXmDGAP+pcB6Y7sEaFWlSa7El8suk2TH2nDCJ9Nhtbni/f0q/rLlDMkAdHmze
         hRFVChP62OeWR+Q1p2U95AL4u/LGDHFDWHxacJC1IexFhzP1Dos332bKeVfNdaVJdi3p
         5BwYP0JbMSnze0/brQYZy1opythCy0Yh7D5Wh24xyQUZDnWVJRupSQLgePr0wk6+tdKr
         xP+OLfznLD0kN/JqkLSmRxiPyxu3sYqg6PvJvqQ/Kp40ipzD9s0WuNf4MAVTyn6ox5gw
         YcwcZiuUa/PXj2l/jPREwFTPa/+le2yv++aJcUNlg018ALOCswrqZlZZqExaTTVyVIzl
         1qfA==
X-Gm-Message-State: AFqh2krWjOOPNMykzB2vof4eoxUearblj5ZOpOvu8iP7y6E5tg+tItOv
	SS01zDs94CyorlSY7sr7VexyTKHa4F1Ta/VR
X-Google-Smtp-Source: AMrXdXve8Zv4YQYfeu7OxjPSKhWdyxWFogIIJWV95hG6TUufKhauRWLHL9hJ3y/s+d4qDAwkYS0U5Q==
X-Received: by 2002:ac8:4f10:0:b0:3ad:5bc:6aa9 with SMTP id b16-20020ac84f10000000b003ad05bc6aa9mr16938129qte.55.1673462320289;
        Wed, 11 Jan 2023 10:38:40 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id w12-20020a05620a444c00b006f9ddaaf01esm9586439qkp.102.2023.01.11.10.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 10:38:39 -0800 (PST)
Date: Wed, 11 Jan 2023 13:38:38 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@linux.kernel.org>,
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Subject: Re: [PATCH b4] tests: explicitly clone master branch from git bundle
Message-ID: <167346229457.6355.15643097499307785717.b4-ty@linuxfoundation.org>
References: <20230108-tests-default-branch-v1-1-58000cfdf024@t-8ch.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230108-tests-default-branch-v1-1-58000cfdf024@t-8ch.de>

On Sun, 08 Jan 2023 21:24:20 +0000, Thomas Weißschuh wrote:
> If not specified git tries to use the local default branch when cloning
> from a bundle.
> If the configuration "init.defaultBranch" is not "master" then the clone
> from the bundle will not actually clone anything, breaking all the
> tests.
> 
> 
> [...]

Applied, thanks!

[1/1] tests: explicitly clone master branch from git bundle
      commit: f72d94dfbbfb5cdba0b37621367ccf2508a8d6b4

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

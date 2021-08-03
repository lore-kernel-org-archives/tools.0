Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB47570
	for <tools@linux.kernel.org>; Tue,  3 Aug 2021 15:24:39 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id d9so14155314qty.12
        for <tools@linux.kernel.org>; Tue, 03 Aug 2021 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aFjO2HrTVrjcVKxoVmnE2zYU+SBdXSVLt/lhzDqtnr4=;
        b=Cada6FDUWOC/S2iuOXfq/zWPvuWFEkq0gcn2zeeJ8lhfw1UpRBnUqzYQBroGDtuk2h
         vzvtVRnzmq9A3FVtJHfXQ0GiyllTcOsFdTq478Mm7+LndEw1kGlrCgRCgr5Fzgg1B5Eh
         MnlcOkiWn98fzC216jfAp21EuuDgyVejA36us=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aFjO2HrTVrjcVKxoVmnE2zYU+SBdXSVLt/lhzDqtnr4=;
        b=M7ougk/b/ssgbVnzru6ssRX6gkoX+D2D19v8Og5jw1gUjBm+rETP0AyNgcgaL63z8y
         sGyllTBgO0iLit9GSCUYR4Cf6NpdhGKISGm5/No6Ai523SYCRcJ+sVfsdQlUuFAqJZtA
         zI+mD0fryOCv6l1+I6LB3kh/N/fk5VbrZ2eR3jU+QSGgii4sEVL4PxZ3kGGJ25LtmBsQ
         HSK/mmxa818DdgvA2iykqGiQTabUJFusOk4175JOB/9eIntY3nVupNeBpq6Sm2B/Hh6s
         2dIjo58SqQeGsc4/4OYfzLkuGQMsxuwNqVSZV/1yWO8WI6bu4RPA5w8ZVKt9RsAyDsl7
         HLyw==
X-Gm-Message-State: AOAM5302HXicVJw7cJ+FxC+2YVWBIrCvl3dY5JRR7LzqmSnNvpIPfxqc
	aP+576HdVnqyDcxLsnPDlUCPyA==
X-Google-Smtp-Source: ABdhPJwrEZnyghcNF2MkmQk6ZpWqS6vEkeW7ORcSd/PoNj7/XZTJ8GkC7yGsynukgmcCLO+hH3n5RA==
X-Received: by 2002:ac8:44c2:: with SMTP id b2mr18542878qto.216.1628004278717;
        Tue, 03 Aug 2021 08:24:38 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id v7sm8069673qkd.41.2021.08.03.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 08:24:38 -0700 (PDT)
Date: Tue, 3 Aug 2021 11:24:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: tools@linux.kernel.org, Marek Vasut <marex@denx.de>,
	Stefan Roese <sr@denx.de>, Mark Brown <broonie@kernel.org>
Subject: Re: b4 picks up Phone: "header" from after the "-- " separator
Message-ID: <20210803152436.c3fe3s4isesr5gom@nitro.local>
References: <20210719213535.vw3u4yg5mgxqysaf@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210719213535.vw3u4yg5mgxqysaf@pengutronix.de>

On Mon, Jul 19, 2021 at 11:35:35PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> I just noticed that 
> 
> 	b4 am 20210718211143.143557-1-marex@denx.de
> 	git am ./20210718_marex_spi_imx_mx51_ecspi_fix_low_speed_configreg_delay_calculation.mbx
> 
> adds the following line in the s-o-b area:
> 
> 	Phone: (+49)-8142-66989-56 Email: marex@denx.de
> 
> . This originates from Marek's reply that can be found at
> https://lore.kernel.org/linux-spi/17bf62a4-af57-1706-f20a-35f9d6cbf9d0@denx.de/
> .
> 
> The same already happend here:
> https://git.kernel.org/linus/ce91c6220947e4efa0db564cc50baa0151d8872b
> 
> I think it would be sensible to not pick up anything from after the "-- "
> separator.

Thank you, fixed in master and stable-0.7.y. A new 0.7 release will be coming
later today.

-K

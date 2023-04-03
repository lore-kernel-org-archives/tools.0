Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE90A944
	for <tools@linux.kernel.org>; Mon,  3 Apr 2023 21:51:58 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id nc3so4967017qvb.1
        for <tools@linux.kernel.org>; Mon, 03 Apr 2023 14:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680558717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sjT5o4xvNfeO0u+mk4eqCgrBLdiXC2jtMg+3Cg0Ah+s=;
        b=BY6rpDxeKb8DeVdtM+UrqqtBzn9YBmX6bA4aCVzqc15IKltnlC8nzdzXUX2K0Vrc5s
         rR/AJVkJ/0cZn1OVgnmzyfP4YNtlc58rT+RvyhSRSjBSmb5NfwKoX3UW3LSA8aMNQnQe
         YAV8wc1lGbzCFiM7EV+aIi7nY68VPP8i17rus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680558717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjT5o4xvNfeO0u+mk4eqCgrBLdiXC2jtMg+3Cg0Ah+s=;
        b=kvA7owhWou+4t5Mu8SC5/jGulxIHJVtY7Rz4vvFoRy74OwtI6n3LzSXolNdm/9lCR+
         N22cmH/g+vB61ANvd2HmLdvaomP7iArkC9HaUjMkD8tPtdokD0Lh8qxmEs9e1JeIoJIo
         icB1vF9YkpnPEGPxDdUfKuy3pJ6dBF5XBMomnkVixwnwJKTjzHI2z70L07Bw53DjM7PC
         U97c8bp6Uu7EEVyPHt556lnWSknADxYrxXuyz5yXQBzNljFGL/OKwl9H9NNC5ubUTUqU
         ESHXY/qXRq6LKO/jsQ0vXrAqndBrB+hlnokOtB2o93jiw6+OhuPLrEvYz/rliDuTEuul
         ftEw==
X-Gm-Message-State: AAQBX9dxZz8qhfrRozowWWcDuSnpQB1RPQEx6T2gOKYMXZf+IdGLsKet
	QmZJlltKflrQp8UScfSZspq/gQ==
X-Google-Smtp-Source: AKy350bTaGQ08kEu83u5p/ijNr8qy5I/X/lIvnEcVkcdouB39xLUA34m5/51K/KXWuL6r29WiCrKHw==
X-Received: by 2002:a05:6214:224a:b0:571:698:eac9 with SMTP id c10-20020a056214224a00b005710698eac9mr39848431qvc.18.1680558717538;
        Mon, 03 Apr 2023 14:51:57 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id a14-20020a0ccdce000000b005dd8b93458bsm2927653qvn.35.2023.04.03.14.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 14:51:57 -0700 (PDT)
Date: Mon, 3 Apr 2023 17:51:55 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Bugbot" <bugbot@kernel.org>
Cc: aros@gmx.com, regressions@lists.linux.dev, bugs@lists.linux.dev, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, linux@leemhuis.info, 
	tools@linux.kernel.org
Subject: Re: Introducing bugbot
Message-ID: <20230403-favored-subsiding-6e49bd@meerkat>
References: <gmnswy45efztvcyc3xqymm52h7cdfwjz64go2wy3zyeqcqwb76@36fva4hyip4q>
 <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230403-b217297-6bf5914fb55d@bugzilla.kernel.org>

On Mon, Apr 03, 2023 at 09:47:49PM +0000, Kernel.org Bugbot wrote:
> Hello:
> 
> This conversation is now tracked by Kernel.org Bugzilla:
> https://bugzilla.kernel.org/show_bug.cgi?id=217297
> 
> There is no need to do anything else, just keep talking.

Thank you for illustrating the "may explode" bits. :)

Unfortunately, triggering on key phrases means it gets triggered when you're
discussing key phrases. I'll make sure that this only happens when the key
phrase is on the line by itself.

-K

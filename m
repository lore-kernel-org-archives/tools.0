Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B488B20EA
	for <tools@linux.kernel.org>; Tue,  6 Dec 2022 22:15:49 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id h24so14895531qta.9
        for <tools@linux.kernel.org>; Tue, 06 Dec 2022 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S3wJb9F8O5AAoJdMahKNviM96dCbf/eSYYm8B3qNzSs=;
        b=QD3qhLrfjg/c8yaqWH7JyEQq8ojeEHiX5MLashBNgutkdvGMnOwnfHfS5ddsnK1HlB
         KtrRxEm5K96Emb1J1h/Ax/X5+koeNXb6h81Vm92I4aVBOQ5anrTVtrNSIGBhGed91dRN
         886IJVFnY99/l08Gt/mMgBUTQ1TovBbA0NBs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3wJb9F8O5AAoJdMahKNviM96dCbf/eSYYm8B3qNzSs=;
        b=ZZO69uWl3L5b7SdpeuhsVROnUFCF+si06JvgLMG21l4EJSk5lIMoiUq/c8J9vuNaXw
         M3Yuw+xYJMvqeL46VBpA3clbLAkjSepLPyUxt0yI8Zodv9N1gt3ixQfs2fNMQoJaS3TM
         oM2yBDOx5+GPtPgTKz1B0T27AdOGMPPg6QNPInfRl/VAumL873kULpWPsI+aFK/q0OUt
         Refx/k731YOFYcZYs7BhcxVRbfRHu68Oi9uyLnrbpcL0pa6QY/TTGCZwuQYLG/bXTOiQ
         Eqq2rL/ZiKhXcRCitMghXLGVgWksnTwKFo7rlc+wdfZj6ljiO7L4PTh41EBAzAiR4dIs
         r2TQ==
X-Gm-Message-State: ANoB5pmXauZyWtM59AYeO5FdEm7i2KpyPm25ImSMba5ryihwrREi8W4W
	xgJL6s0KW7TM8+y1o5YRr5mJlQ==
X-Google-Smtp-Source: AA0mqf53JXWVMpd94kGhZ61eTY8cTrIWm2H9tlm2ZmbjQeMC8ySGEBG3Z71VCji+PpTJu9tiofs0pA==
X-Received: by 2002:ac8:7745:0:b0:35b:ad00:5d9b with SMTP id g5-20020ac87745000000b0035bad005d9bmr83181064qtu.417.1670364948614;
        Tue, 06 Dec 2022 14:15:48 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id g9-20020ac80709000000b003a7e8ab2972sm3078626qth.23.2022.12.06.14.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:15:48 -0800 (PST)
Date: Tue, 6 Dec 2022 17:15:46 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: b4 prep HEAD fails when specifying branch point
Message-ID: <20221206221546.ezjxmz2w3tuxbzx5@meerkat.local>
References: <Y4+9Fz7lkzSnFV72@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y4+9Fz7lkzSnFV72@sirena.org.uk>

On Tue, Dec 06, 2022 at 10:07:19PM +0000, Mark Brown wrote:
> Using Debian bullseye with backports of git installed to get
> filter-branch if I attempt to run b4 prep it refuses to create a
> new branch saying:

Thank you for the report -- looks like I broke it when I fixed it last. ;)
It shouldn't break in the current master.

-K

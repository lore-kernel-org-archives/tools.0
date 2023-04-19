Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029B3236
	for <tools@linux.kernel.org>; Wed, 19 Apr 2023 18:30:49 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id ey8so235259qtb.3
        for <tools@linux.kernel.org>; Wed, 19 Apr 2023 11:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1681929048; x=1684521048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/jAo8dyixzyebnLKybD5aNdk9UveUK8auk/zTUGq8pg=;
        b=aoZMPX+evxRYHd3ur4GgPSTnjLSTd3VpaEPI4ffRE6cVJ9kCzHBt1ZTVffr53zyRtS
         5YhONoie1J+SHV8u0mPPg/BXpukYK/iB4BBsKCtpNerlM1PVtPw5Lrbg3gzEPIdcCNIl
         HeLz1qAjc9HCZRy4OKPuJYixc6PxdjQJZYOuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681929048; x=1684521048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jAo8dyixzyebnLKybD5aNdk9UveUK8auk/zTUGq8pg=;
        b=Q7IS0fqLdg6eWThXt71mLJzYTVUyAGIxxAP3CjzXyjrTAQZByphX7RFXzlHvIhpUdK
         p2ZQJ1y/3D81l7bYSMZNSNIxGM25M9jz8U8XTiDuTPrtWNpLXObAz8F9ab7Uj1rb/Ibn
         IqGBTVrydPDxD3SN0GfPSK9uSKNmKTwY0kKAq20lOh2olrO0nVCRuZl8pwkZ+7ireI9u
         JqRripfuQ5TxiT5ifqvH6y1DX+zm1KD8AhsMa2/773U7uvlUBb6vuEYvltCOWg8uoZxl
         ZlzVoFBgHgMwYPUbCQEaizEZHfcAL1jOQ1V42lDrZXGksSKn3+DmLV/EVaJPoQgFYZ5G
         eYbA==
X-Gm-Message-State: AAQBX9dwlBwMoxYx5jyt74EyuEP/uishg7VZULIUIa9/S5CNWwymNa+e
	VwWllmwIVzdovkuLsH0KCYiigQ==
X-Google-Smtp-Source: AKy350a0txT/3pvtIHfQ55ywuC6uuOEkbaHAFpIdO+lT02mO/BL854wF0wRlgRFtRmmhTatgkFCr7w==
X-Received: by 2002:a05:622a:34c:b0:3e6:3611:46a1 with SMTP id r12-20020a05622a034c00b003e6361146a1mr5379011qtw.9.1681929048360;
        Wed, 19 Apr 2023 11:30:48 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id bm38-20020a05620a19a600b007422eee8058sm4828566qkb.125.2023.04.19.11.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 11:30:47 -0700 (PDT)
Date: Wed, 19 Apr 2023 14:30:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: icon@mricon.com, tools@linux.kernel.org, mjg59@srcf.ucam.org
Subject: Re: executable sendemail.smtpserver and b4 --reflect
Message-ID: <20230419-closure-polymer-f7a6ac@meerkat>
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>

On Wed, Apr 12, 2023 at 12:00:09PM -0700, Nick Desaulniers wrote:
> I also noticed that my name wasn't being sent on the From: field to
> LKML. I assume that's an orthogonal issue, but is there anything else
> I should be doing there?

I don't think it's b4 that is doing this. I think Matthew mentioned that
sendgmr will rewrite some headers to match your internal authentication,
perhaps that's what is replacing the From: header?

-K

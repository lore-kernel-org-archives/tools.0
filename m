Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F3C8471
	for <tools@linux.kernel.org>; Mon, 27 Feb 2023 20:26:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id v11so4542234plz.8
        for <tools@linux.kernel.org>; Mon, 27 Feb 2023 12:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677529566;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ajTTHZcZm8Jmmg1CmeyVWZGtfRhttL1hrN1XMgLjjE=;
        b=EGi2qDZFgRnE6ZBM3mx+wqjOSY3qmzBs3tGvSutkHH/6oIHnmdLfr9xJ+SEoUgF93I
         VrAE97p76SxCuMjERIIaXpQI9Z0oMZQfxRi0w4brx06qTaoWXB6EUKJrTU5K3J3NsnzJ
         /pdjyM+DNL8SAM/vs5FW5pwayQ8rVpuFs2126pTt+Fe5ejOVzSORNQCC4LlmD5TrJBss
         5YMbMI/A+uszg50P69c6id0xebCGAJbBBakjQPYBeLk1Tc4wEGhopIZoz1IiYX+InNDW
         GnVdweVbCae6krXxyr3RIJITYdMUVIm8ScFgmwgT4FDKBd7KoviTXhB1ECcxjYBba3El
         8b3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677529566;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ajTTHZcZm8Jmmg1CmeyVWZGtfRhttL1hrN1XMgLjjE=;
        b=R0pXjPVD7kEvHtEdk9Pk1kW59aFuTwU9Tc2qwUCdJSDEqCwapGE0FlbR/XqlMVzQIt
         C9u5TzAFE4NM6diNX15pqxuTL4Rx1veP1MIosESdIfp2O1S4QCYyB8DvyGypMqjqTpxZ
         7SHXGAiqeQMkYnIdUcXwlhIEONqtkr+IKYd29EbOhPn15Jfsr+ToxTd8+GAZfnGk67g6
         BrRze0oLbWrrP8+jYX80WfzKjhyOaHiS0Sxaf52ugjFRFRcuYgRL3TxGD2C8wa5x01o9
         uhhwJkrJqv3mOaQz14LYYeG8g85eQvAoJNoSBUTHWfL/uqydq728Ix9B8kxDcfvl/RT+
         244w==
X-Gm-Message-State: AO0yUKVWYnRg5Z4jD71QvtIcE9+sttBXQcTE+Gl/DFgkhrj41/yfV7u5
	u8/NZH0kXxCNCGxOkDlSI0y+YP1ZahtOgygO
X-Google-Smtp-Source: AK7set/8pnhuQPhzUuU/N31V6VeOvoxEEfj2VwJWtloFzYiGm9rtdEQrc7KWNSYJNvKaVA3rV+xm0Q==
X-Received: by 2002:a17:90b:380d:b0:233:d870:f4c7 with SMTP id mq13-20020a17090b380d00b00233d870f4c7mr455454pjb.21.1677529565658;
        Mon, 27 Feb 2023 12:26:05 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id fr19-20020a17090ae2d300b00233bab35b57sm6532501pjb.29.2023.02.27.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 12:26:04 -0800 (PST)
Date: Mon, 27 Feb 2023 12:26:04 -0800 (PST)
X-Google-Original-Date: Mon, 27 Feb 2023 12:25:19 PST (-0800)
Subject:     Re: [PATCH] shazam: Add the --add-message-id argument
In-Reply-To: <20230227200930.qdynviatehu5i4br@meerkat.local>
CC: tools@linux.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: konstantin@linuxfoundation.org
Message-ID: <mhng-d926c57f-ccbe-452c-a5a0-3861198c60ce@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 27 Feb 2023 12:09:30 PST (-0800), konstantin@linuxfoundation.org wrote:
> On Mon, Feb 27, 2023 at 11:05:19AM -0800, Palmer Dabbelt wrote:
>> > Yes, and you can also add it to wtglobs in get_main_config() in init.py, which
>> > should allow setting this in .b4-config for projects that want to add that to
>> > their toplevel.
>> >
>> > Do you feel like doing a v2 with this change?
>>
>> Sure, but if someone else wants to take a whack then I'll be more than happy
>> as it'll likely happen after the Linux merge window, QEMU soft freeze, and
>> GCC branch...
>
> I can make this change -- should be straightforward. Thanks for the
> suggestion.

Awesome, thanks.  No rush on my end, I've still got a few other patches 
in the stack so I'll be running my local copy for a bit either way.

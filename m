Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EBD7B
	for <tools@linux.kernel.org>; Wed, 24 Aug 2022 14:10:38 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id h27so12712924qkk.9
        for <tools@linux.kernel.org>; Wed, 24 Aug 2022 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:from:to:cc;
        bh=g7uPtpxGTCU7FYSa2pAM1zWGqzZKompVD14uI/lcZp8=;
        b=cbYCI799R+OdzTpSe+pJA2w91H026TwGwm2lWjg2xfUI1ZfGuabTTGBKQ8YfMHPPOe
         E3yxD5/10uPyOIhxiGMvPXR9LwZCZqzst1xOFcY9e58PU3ZN8LmVnIxO4QFfwGmFCXbM
         ZZdJBd9keViTAikurH3LLk/Kjc1/Rs9kKSRmJ/6ta86sm4RI62imGqzh8qTPWCYoilAp
         C5Cfu/5ReRiOLhA9PQuyEpf2MJVIbxO7RU5O42QiNdqVAZpwOIt9qCmcVce4ozKBsDaZ
         /5awX+c8T170QsNmcOqT5AGAz4GDnsMMQWLn+LPxgg/nc+OD4AmUhn/1eX7ipoEJbMa+
         DmQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :x-gm-message-state:from:to:cc;
        bh=g7uPtpxGTCU7FYSa2pAM1zWGqzZKompVD14uI/lcZp8=;
        b=A1hpYJUPPXhyIN6cd/6TJkUb+linQitOaOch+QZv8/WmPHgtU6a/t88qlHZd/JXaWw
         uoqKTMImXiWzZPJRYrc02mNA9h2b/Z2Kpa/a2ZovYbbKclB0w0c2zk+9KAIus61sWE0h
         nyB8wMFPeL3C2iow086n5dBdjf3F10tu2yKkyGuWdCZvyYC+OM6zi1jkp5cTu53C8Qh8
         Ye2O9H3G64fizZ3bw57jNuAQ2E2fhPPA8KzW1Ln02jBCYtxixEplJrd3ehRKqYO5PqrX
         VwFJjfWyGRSDk/A9mfbZ5JQflK4Iol5VGx8wfbO8TGh9r3UqLPjd0D5NlPdLg0yxLT4B
         NYdw==
X-Gm-Message-State: ACgBeo073dVcytBxdMEl9REe0sXPVy6Dahr5YakbfiC3mw5v+1Fx0HAp
	X9Sq/y222pOV+cLddtTkgmRaBCKmv5Q=
X-Google-Smtp-Source: AA6agR6OYCtCRa+RGclO6QSf4TcuLlzj2n7EwEyH9Ik0zMmrZYsitGNxSeYPmYojfq+p7FzV00Y+hg==
X-Received: by 2002:a05:620a:16a1:b0:6bb:2159:abf9 with SMTP id s1-20020a05620a16a100b006bb2159abf9mr20016588qkj.469.1661350236921;
        Wed, 24 Aug 2022 07:10:36 -0700 (PDT)
Received: from [192.168.1.128] (173-246-5-136.qc.cable.ebox.net. [173.246.5.136])
        by smtp.gmail.com with ESMTPSA id az44-20020a05620a172c00b006bb87c4833asm15271998qkb.109.2022.08.24.07.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 07:10:36 -0700 (PDT)
Subject: Re: [PATCH b4] setup.py: bump python_requires to 3.8
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 tools@linux.kernel.org
References: <20220824030526.49825-1-levraiphilippeblain@gmail.com>
 <166134967564.440655.17645159218754031307.b4-ty@linuxfoundation.org>
From: Philippe Blain <levraiphilippeblain@gmail.com>
Message-ID: <8b5987bc-0969-c8a5-51f6-3669b2ff8881@gmail.com>
Date: Wed, 24 Aug 2022 10:10:35 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
In-Reply-To: <166134967564.440655.17645159218754031307.b4-ty@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit

Hi Konstantin,

Le 2022-08-24 à 10:01, Konstantin Ryabitsev a écrit :
> On Tue, 23 Aug 2022 23:05:26 -0400, Philippe Blain wrote:
>> Since c95e4d1 (am: Fix broken guessbranch handling, 2022-03-31), b4 uses
>> the 'extend' action for the '--guess-branch' argument. This action is
>> new in Python 3.8 [1], but setup.py still lists Python 3.6 as the
>> minimum version.
>>
>> This leads Pip to allow installing or upgrading b4 on Python 3.6 or 3.7,
>> but then any invocation of b4 fails with an error from the argparse
>> module ending with:
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] setup.py: bump python_requires to 3.8
>       commit: 65ba7a9d3ee989035a875e7c108f1733e92c7ea0
> 
> Best regards,
> 

Super! Would it make sense to merge it to stable-0.9.y and create 
a new release ? This would avoid the problem for people upgrading or installing
on 3.6 or 3.7, without waiting for 0.10.0 to be released.

Philippe.

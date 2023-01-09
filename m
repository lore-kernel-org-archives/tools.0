Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27DF02F32
	for <tools@linux.kernel.org>; Mon,  9 Jan 2023 20:35:56 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id ja17so7178058wmb.3
        for <tools@linux.kernel.org>; Mon, 09 Jan 2023 12:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=guwCGdXf1g5/03lhW72lku6Fpk6FrszSAeLeDX2LYeY=;
        b=aigVYq6YfMxJ7Kkz62N8xT8Fe0tBYuxNtHwnag7BjdFnZdaRd+k9pPBEMvIgmpSlxe
         D2L2Qt6iKcTX3ArMiinOx+0YaLHCRPoOZA5NqMcDyshEWdnmI0GsgzR3UHQoZ1K/71nJ
         orwP99823BTrkqi7pFnyMa1iUcMX5s1ZAV/GS+8GGuFZwGg7kKXcEAuYh5vA5ms5nIuu
         eonYKaeoPZibA7fELm4zM23GYZmHz5YmWCselJTJrBSWuNtoMQcX6H7E29elkuwZ/Cay
         lvyhx+WMaFiKzGQZx1gvycQKeML4TSE8jmWIVLQyrM5NSqzVrfRW/bEnQF7GXMpw+gjk
         NasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=guwCGdXf1g5/03lhW72lku6Fpk6FrszSAeLeDX2LYeY=;
        b=MuhS1QhVG2KaQcJtE8lPJJUsw3jjGawB5r2kIfgeSURnjarlGhtZMdb4G+A8j5fgrt
         5t7k1Pdv2o6jOowgpCkp07aDGc+SuRCDTW5hiqrl7ZczMnw3nVgSeGM71EftavzZU4WW
         t5QJLy5/3W/N9Gjk7CGxbiCQgbMOG1zwT5oMU1HjFAEs80rRoLAtShzJ+tkDh5ZiZpq4
         cpa4TM9EARD3aa047gME4AcAU8pm7uaWfkmWJU9OUlDeEdT4lGOa0rCe8BpNmTHDtCBn
         Ve1PHq9BBxq/XH/w2PVnVo+qbVXibcwmdSAk66ZxcnLTrWZVR70yUNUAlcMwp3gM76a7
         9Nlg==
X-Gm-Message-State: AFqh2kpQhIZx1qJJoeSehULi7i3oRE+czU+vCEx3lg0UuFWlfBRHykMJ
	NLLENaPQ1AoPWOJ4ajsignuEOSBl0wkvtlHq
X-Google-Smtp-Source: AMrXdXuGtBi/Xxhqr6CKexThMc0mK4G/hjtoM9KgS3jP6e608fWo6CDLWV62k8aDHx6QSX/IUi+qYg==
X-Received: by 2002:a05:600c:1d98:b0:3d3:3d51:7d4b with SMTP id p24-20020a05600c1d9800b003d33d517d4bmr48598422wms.29.1673296554921;
        Mon, 09 Jan 2023 12:35:54 -0800 (PST)
Received: from [127.0.0.1] ([77.243.191.41])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b003b4cba4ef71sm19721671wmb.41.2023.01.09.12.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 12:35:54 -0800 (PST)
Date: Mon, 9 Jan 2023 21:35:55 +0100 (GMT+01:00)
From: Matthieu Baerts <matthieu.baerts@tessares.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>
Message-ID: <efac441a-ae6d-4d4f-b6ec-ce54a80e812d@tessares.net>
In-Reply-To: <20230109172859.2o2gwntkpsvavonp@meerkat.local>
References: <956012a2-6a7b-3347-8b19-975fe71e4ea8@tessares.net> <20230109172859.2o2gwntkpsvavonp@meerkat.local>
Subject: Re: [b4] "b4 (shaz)am --no-parent" gets all parents
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Correlation-ID: <efac441a-ae6d-4d4f-b6ec-ce54a80e812d@tessares.net>

9 Jan 2023 18:29:02 Konstantin Ryabitsev <konstantin@linuxfoundation.org>:

> On Mon, Jan 09, 2023 at 06:24:30PM +0100, Matthieu Baerts wrote:
>> Hi Konstantin,
>>
>> First, thank you for maintaining this great tool!
>>
>> I'm using it for a bit of time now to apply patches in my tree. Today, I
>> noticed one issue with "b4 shazam" and its option "--no-parent": when I
>> try it on patch 9/12, all its parents are also applied. I don't have
>> this issue with any other patches of the series:
>>
>> =C2=A0 $ b4 shazam --no-parent
>> 20230104171526.1416746-10-matthieu.baerts@tessares.net
>>
>> I can easily reproduce the issue when I launch this command on top of
>> Linus' tree. No issue with the ID -9- or -11- for example.
>>
>> I'm using b4 0.11.2 but I can provide more output if needed.
>
> Are you trying to cherry-pick a single patch? In that case, you should us=
e -P,
> not --no-parent (it's mostly for when someone submits an unrelated patch
> series in the middle of a thread). Try:
>
> b4 shazam -P_ 20230104171526.1416746-10-matthieu.baerts@tessares.net

Thank you for your reply!

Sorry for the misunderstanding. Funny, it was always working like I was exp=
ecting it. I will use "-P _" from now!

Cheers,
Matt
--
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net

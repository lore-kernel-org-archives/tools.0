Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED5673C0B
	for <tools@linux.kernel.org>; Mon,  9 Jan 2023 17:24:33 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id qk9so21941960ejc.3
        for <tools@linux.kernel.org>; Mon, 09 Jan 2023 09:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbeXhSLJCKF1MnA/55Dlzl7wvkX44YCaU8Fb5JxAyWo=;
        b=3eyOmCCnpqo2A8jUGSYL9BC95t75cTGxE7MI00RMeW0otv0g2Rtw9DcsuttISq2mo8
         HvCPwBRCprClVdeKpRC5YbOzIB01dOc9xuUWjA2LHZo0wvD9olx3QCv/w74GAEIASeX7
         RZkx/0g5UZNhnxcCv1qshw5rbADMdfb6VP0Y7GB9MMnTTxCKdqKUGiS00G/ukN1gEMVc
         9nMwk8Lht8W639XKwbHHE4ZzQgry/fVKtMOHJuRR+3m3eRNLmhBJdpdzcw4UP5OPIivJ
         FLjwzhtu6zwcbjt8b3gzMl+/nUQGxMYAKFdFH4fRyEFJMnQk/jROwaSIdqnpUWkn1vcR
         c1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbeXhSLJCKF1MnA/55Dlzl7wvkX44YCaU8Fb5JxAyWo=;
        b=WeNHcv8FROSQaPn82TLrliokvHmy0otlJaTP5oSdcV7PKYJfoRfV4kfQLQNi9utqEx
         KqmfSiY7uSIrzv1GKZcjZfeDyWhQ4sagBog0of2B9eGj1ktyaEaTUfvMwmxHaMJypv4M
         ZE+Dl9jTI3DyVhMmj2t8T8BfJub2hnwJchcFRDl3NdhiRmiBIyO6goLJ19plqNXwysQY
         +zjLr5IhgGPemnnWM4z75hqaPMLvIs2W1wlziVIh6trleo9pArdvxN3HPqhsC6mrXWYz
         LnDy7A5iyURhX3SgoNwtlLN+mEOZ0/salppUyvLe4QlHpYWTevrcxk2z0sUjPFMOEeUc
         Z73Q==
X-Gm-Message-State: AFqh2konWZycYS+0Gu7zVeH0YHbn67D+118TSvLMUBq/9fF6/E9m87Qw
	DvB27kYqymlSVZvu8kO7O+kp/w==
X-Google-Smtp-Source: AMrXdXuHeyIChUELgHTmYW0psKbgwnV5BR6O/S5mmJXXtXHvKHKo0MKsOz5Sp0awRAPKUleCN7LXZw==
X-Received: by 2002:a17:906:d052:b0:7c1:5098:907a with SMTP id bo18-20020a170906d05200b007c15098907amr58544154ejb.35.1673285071825;
        Mon, 09 Jan 2023 09:24:31 -0800 (PST)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id ku21-20020a170907789500b0084d43def70esm1983494ejc.25.2023.01.09.09.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 09:24:31 -0800 (PST)
Message-ID: <956012a2-6a7b-3347-8b19-975fe71e4ea8@tessares.net>
Date: Mon, 9 Jan 2023 18:24:30 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-GB
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Tools <tools@linux.kernel.org>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: [b4] "b4 (shaz)am --no-parent" gets all parents
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Konstantin,

First, thank you for maintaining this great tool!

I'm using it for a bit of time now to apply patches in my tree. Today, I
noticed one issue with "b4 shazam" and its option "--no-parent": when I
try it on patch 9/12, all its parents are also applied. I don't have
this issue with any other patches of the series:

  $ b4 shazam --no-parent
20230104171526.1416746-10-matthieu.baerts@tessares.net

I can easily reproduce the issue when I launch this command on top of
Linus' tree. No issue with the ID -9- or -11- for example.

I'm using b4 0.11.2 but I can provide more output if needed.

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net

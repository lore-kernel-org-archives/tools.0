Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A413FCD;
	Thu,  2 Sep 2021 18:45:47 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id c42-20020a05683034aa00b0051f4b99c40cso3800661otu.0;
        Thu, 02 Sep 2021 11:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=B7fK8r5B7KvM9SSfjLWPrUvP2TetynZ3IRvivoFB3JU=;
        b=NQILkOvIHGUKYn2oliQo90isLCvlBQeK5qI+DkdWtvj9NstUjk+MM7IIV+rXqf4ZBp
         z6oU6mucTEknP51VMNm9d/MJL+HZnU+Wy1DvW2okTEMkqDRNV5QfhjVic1Knl0wlsHp9
         Ogk67Vu7ygZEGELv/ywT59puR8tadTYfhzkAi62QrrVZnjNf93fIjMnkGxUtOJm7zFIS
         ZRKJToLoP9yZzP/P6pKSTuqbEASzPP/h077US4qUYj6GsF1aYsNeTje1SGbeIfxuZrsC
         PDkX+resxhvqUENkQqxEzu83AtCUkh3qmClmm9//IoLAineGLV/dpwO7HyMTbPnpBBXN
         b6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=B7fK8r5B7KvM9SSfjLWPrUvP2TetynZ3IRvivoFB3JU=;
        b=D13tQnq6DNRGFDLa4cIoDbOLI4ZK1iO9R3JKyGRAUnyhIcww8YviPsOwJYkAT6pW9D
         ojr3XfkRvqQTFnI+FfzmT2tVxNAYFahlf6KrWOH+xgl4tbHmfwgiXhuONbHyo4qL73Ub
         Q9mLJVvXS8TcZTDTQmTP76Qkd9KIk6wXatnBaN2Hf4JjgbWpOavxlvzv8VA9wtcxtN3h
         szNObFhWEtGoCMCz9HE0/WpC4aM084ME4D9l36uYWoVUT1Dc84vAnRZXvrACxEGyEpWE
         f0LtBbc2JbIAwgS7MTh7o1UNqNbJhF4ebvKLBBlXzLibIeUXLnycOKjfGtT3ER8c6w+4
         jImA==
X-Gm-Message-State: AOAM530uE3YIpaWB48IkjHv4d+qgx80QhIyHA/7iQcZTESZuQZ9neipj
	8qqOyoVn7DkQeu/clAsjeRqFjBsTh4U=
X-Google-Smtp-Source: ABdhPJxEsDeZar7c3N8GX4ltvMt6Eh3X5IzyyFR9lkxuXu74kAiW0MH2Z9IG0toCrwwhU7Wz7JTz8g==
X-Received: by 2002:a9d:d35:: with SMTP id 50mr3821265oti.22.1630608346633;
        Thu, 02 Sep 2021 11:45:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b24sm526124oic.33.2021.09.02.11.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 11:45:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 2 Sep 2021 11:45:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <20210902184543.GA1133629@roeck-us.net>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210830164626.tq5emfrht4o46x33@nitro.local>

On Mon, Aug 30, 2021 at 12:46:26PM -0400, Konstantin Ryabitsev wrote:
> Hi, all:
> 
> My tests of the new lore.kernel.org service (currently running on
> x-lore.kernel.org) are looking good, so I will be putting that into production
> on Wednesday, September 1, 2021.
> 

It appears that lore.kernel.org/patchwork is gone. Is that on purpose,
and/or is there a new link ?

Thanks,
Guenter

Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A7214278
	for <tools@linux.kernel.org>; Tue,  8 Aug 2023 16:18:48 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-63cef62a944so37685956d6.1
        for <tools@linux.kernel.org>; Tue, 08 Aug 2023 09:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691511528; x=1692116328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qzoCYwUqg8W5v1dRpCUksy0VOlOoXxShl0USZKTXUWo=;
        b=QTX0XJANmCO3wLQ5LhmHVf55Igu5knYrkJdz+SZpomRvNFTwJ3/5zI+4VLP/uopzK5
         a2W3SB/gNA/qi6z3rLQHLI09o2rFo1kazN7vA+iOYbPb0muIVUypJPYFNaztE9osEzAx
         bCeoxWzVF6oy5LpYAt7V223RjrYxUlv/WWXC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511528; x=1692116328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzoCYwUqg8W5v1dRpCUksy0VOlOoXxShl0USZKTXUWo=;
        b=kASB7WSwlosQQJ2temflhLsBdKVJeEb0brY6w7ILl/m6vYApPGgdg3EwgwbcheXEp1
         LbycncqpY8KhWCUmRQmKifxYMz8m8tTUjrCI3XFUWaYMrShWipkf9ZhJKYbSRrDqkFnM
         JMSQr4hOqnfgBM0pBm40lI2BKVhLvjU5RqPz6KuXyfeO/TTDcYaQDhgHZSuM39bTSqDE
         ZxUxXZIncn45pl4zovtCtg3gxtaVEfLSVggl3nRduCAe5poRINK1uxrl9DdQ5d10vKvC
         2lVQVVscW54CTpR/KyT0wDt5JpVJGiSOhFWrJqKx6SFa1i2dOeDvsBNvgkRmd7lg4gn4
         MG4w==
X-Gm-Message-State: AOJu0YyR+QMAF2AhCA/I3y7rFY71k0bS44QrHqx86MPh7vUM6v6wU5us
	KkWctvMISfGDTT7iqU/2m4k7jvHhTrutqYyqVX0=
X-Google-Smtp-Source: AGHT+IEtbIGbtSXxY5waTH4i2soiZ5BKZKRAjeDRKK/TdVGIqjyqpZnrgHc5zZyGJ8VVuPanky7CAQ==
X-Received: by 2002:a05:6214:5841:b0:637:85e3:2a2d with SMTP id ml1-20020a056214584100b0063785e32a2dmr12960970qvb.58.1691511527865;
        Tue, 08 Aug 2023 09:18:47 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id h16-20020a05620a10b000b00767da9b6ae9sm3389764qkk.11.2023.08.08.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 09:18:47 -0700 (PDT)
Date: Tue, 8 Aug 2023 12:18:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Justin Stitt <justinstitt@google.com>
Cc: "Kernel.org Tools" <tools@linux.kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH b4] b4: add checkpatch via prep --check
Message-ID: <20230808-equipment-aspire-c4bd2d@meerkat>
References: <20230803-add-checkpatch-v1-1-2952aee9e2a8@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230803-add-checkpatch-v1-1-2952aee9e2a8@google.com>

On Thu, Aug 03, 2023 at 10:45:53PM +0000, Justin Stitt wrote:
> This patch adds support for the following incantation:
> 
> `$ b4 prep --check`

Justin:

I see your patch, but I want to step back a bit and have a broader discussion
about various pre-send integration checks, especially when it comes to how we
report errors and warnings to the developer running the check.

I will send a follow-up topic to the tools and users lists. For now, let's sit
on this and adjust based on the feedback I receive.

-K

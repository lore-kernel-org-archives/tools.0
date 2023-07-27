Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B26FBEF
	for <tools@linux.kernel.org>; Thu, 27 Jul 2023 14:43:00 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-403a3df88a8so6362641cf.3
        for <tools@linux.kernel.org>; Thu, 27 Jul 2023 07:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690468979; x=1691073779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Httv0jK8FZxMDhWaPoTVNIHFxb50opx4lPnFuwxv8Qs=;
        b=UDxDaf3tJWDtMaWD8b8gP0hUYweDfX6ilwS16OXHp0N+q+1iDAR7rJYU0HwrmFhsyG
         ygWEg9NvuFTBoLsr2nef7GN8+Qq1k04LYYoT7YyRjGfA4WsZk5wlOcB9OlSau1RoFwZ0
         kyruRYOZ3/ZeYKt01sAQzVkusI1mjQ6s4LkBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690468979; x=1691073779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Httv0jK8FZxMDhWaPoTVNIHFxb50opx4lPnFuwxv8Qs=;
        b=BOUIxD7LamtprG85V4MooGPBi6uDhTPAvvlzPO6M1cs0d/d6wkxCWPiW43kCqiYMWj
         nNJZVOkaLNn3izVf8h1FHbvr+52u940PJqfmLSzEkyco1kCV2DccJnoYy52x8sax9D5M
         ASLpn4VOjFst/qgKO46dZa+W4tmS/QA8YhsZyGc5AhGmMmXjDttyNHTjQ68IxJ59JdMc
         56MLE+Q0XulDlQcu9VO3GVjq4DqRJjhLdGkQJJYlyqork8H1KvG6XaA6BszIO26W3v2i
         iwZYg3lOHOfir88ITyecouxCu5NoO99ZOdD92lowpO7hm0PcNDW6/ZINFGU8chfenP5M
         DzRw==
X-Gm-Message-State: ABy/qLa9S9nXJ33IVTjexVLVKFJ53JzC5Ntx7N7YjKJodblr2a5xDW/u
	tqtDIeFye45KBWAputzwXfCzFQ==
X-Google-Smtp-Source: APBJJlHCYvkcNAiDzGn5WtoFYtbokC8XenLhqfnqn+hNwqqsoBOkAiaczEJvIMNfQ+0DgOFWAPKMlg==
X-Received: by 2002:a05:622a:1790:b0:3f8:4905:9533 with SMTP id s16-20020a05622a179000b003f849059533mr164850qtk.50.1690468979233;
        Thu, 27 Jul 2023 07:42:59 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id f24-20020ac840d8000000b00404f8e9902dsm481586qtm.2.2023.07.27.07.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:42:58 -0700 (PDT)
Date: Thu, 27 Jul 2023 10:42:50 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: tools@linux.kernel.org
Subject: Re: [BUG b4] Encoding issues with --auto-to-cc
Message-ID: <20230727-demise-fruit-52aab8@meerkat>
References: <1940519.PYKUYFuaPT@radijator>
 <20230726-gush-slouching-a5cd41@meerkat>
 <1858953.tdWV9SEqCh@radijator>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1858953.tdWV9SEqCh@radijator>

On Thu, Jul 27, 2023 at 12:02:16PM +0200, Duje Mihanović wrote:
> I think it's wrong to say get_maintainer splits up the unicode sequence, it 
> straight up ignores the first half of the sequence. Perhaps I should file a 
> bug for get_maintainer.pl?

Yes, you should report the bug for sure. As you can tell from your originally
submitted series, it's manifested itself multiple times already:

	To: =?UTF-8?q?=87?= <duje.mihanovic@skole.hr>

-K

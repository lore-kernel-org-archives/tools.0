Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816481ADCC
	for <tools@linux.kernel.org>; Tue,  1 Aug 2023 16:14:32 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-76c4890a220so477931285a.3
        for <tools@linux.kernel.org>; Tue, 01 Aug 2023 09:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690906471; x=1691511271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MMNv7fhK/ipvAP19XkQsCYJRTtXbeiKn2RJ+Ym3NtAo=;
        b=AY2Kmijx4oD3/ElUBh1QCI3MBa/Rl8ffhESyM1iJFHIarXnclKT0Bqcf9KI2DDrsOQ
         tcX9+JG3UvnMtFj9Qx5fv0lX+EOF7D9ALbmTvhYKiBkFNseGmej+SpsmP+cQVWDRNbDz
         jz93PNx41J2xaDnWjwkP+sgPNe/e1Id3MsQE4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690906471; x=1691511271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMNv7fhK/ipvAP19XkQsCYJRTtXbeiKn2RJ+Ym3NtAo=;
        b=DgcAF2VECqBB+PzM0eQeXLE4Vkhw7UVj7XzfgTyr/4YllXjoZx1PAbBWtN3iroSGcr
         ozDVWhEl0eYX034XI2rl5LutUxANWShDCtisl5L0n+56Pk9MOgDsfPOb6mM+PzTtSXfF
         4bJqNUGUa6QVIti6MUXwDCQB/Dsma00/7Adc69l/Z95LpJb8tZrjQrWl3Xde3uyPSG9O
         l8cFqNXNvvD764YhCkSF0r/35yShNYAf51Y22ZdUxpOKa2kOENqvsl5hSOJ9upwBuhl/
         I56seEfor5kpAg6Nl/fm+YYgAFJFYk+xNMwynjL07neZWpdWO6l2ckIbG0LNnrpXWV2N
         Ia3Q==
X-Gm-Message-State: ABy/qLYtON4LubZl/yAWT0iPQsYUU1aqYo4aslcMvZha9VFnw3bGaRw4
	TENgOsqQeAgOKK4TLB/Bduba7w==
X-Google-Smtp-Source: APBJJlHRIJ7DE/d/QpgX4yHyxfzrgPPXNaoqI1G2+EHFVU4p+bgnhoygKkZT67Wj5ePntN5qv7RRsg==
X-Received: by 2002:a05:620a:d83:b0:767:3a10:d6de with SMTP id q3-20020a05620a0d8300b007673a10d6demr14507136qkl.58.1690906470963;
        Tue, 01 Aug 2023 09:14:30 -0700 (PDT)
Received: from meerkat.local ([142.113.79.114])
        by smtp.gmail.com with ESMTPSA id c10-20020a05620a164a00b00767d4a3f4d9sm4242670qko.29.2023.08.01.09.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Aug 2023 09:14:30 -0700 (PDT)
Date: Tue, 1 Aug 2023 12:14:22 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: j.granados@samsung.com
Cc: "Kernel.org Tools" <tools@linux.kernel.org>
Subject: Re: [PATCH b4] ez: Add a --web arg to force web endpoint
Message-ID: <20230801-giggly-postnasal-707142@meerkat>
References: <20230801-jag-add_web_switch-v1-1-a0021c1ee8c2@samsung.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230801-jag-add_web_switch-v1-1-a0021c1ee8c2@samsung.com>

On Tue, Aug 01, 2023 at 05:03:36PM +0200, Joel Granados via B4 Relay wrote:
> From: Joel Granados <j.granados@samsung.com>
> 
> Make it easier to prefer going through the web endpoint by adding an
> argument that will force this path. This is for users that want to use
> B4 for preparing and sharing patchsets over mail and need an argument to
> activate the web endpoint whenever needed, but want to default to smtp
> server for the rest.

Okay, that looks good to me, but can you please make two changes:

> @@ -330,6 +330,8 @@ def setup_parser() -> argparse.ArgumentParser:
>                            help='Initiate a new web authentication request')
>      ag_sendh.add_argument('--web-auth-verify', dest='auth_verify', metavar='VERIFY_TOKEN',
>                            help='Submit the token received via verification email')
> +    ag_sendh.add_argument('--web', dest='send_web', action='store_true', default=False,
> +                          help="Force the send command to go through the web endpoint")

1. It doesn't really belong in this argument group (it's just for
   setting up authentication and says so in the title). You can just put this
   switch with the main arguments, perhaps as the last entry.
2. Call it --use-web-endpoint instead of just --web

Thanks!

-K

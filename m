Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DB42CA0
	for <tools@linux.kernel.org>; Tue, 18 Jan 2022 18:00:09 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id f17so23006014qtf.8
        for <tools@linux.kernel.org>; Tue, 18 Jan 2022 10:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CdJhgQI1mzO90/bv5vr21gO32sraxkNt5npxN7ncfQc=;
        b=RIufNAjC3ONuYDlSuHGi74OgPb7K8Y5nOTjMft463obh3D08AiRlpXZyAx8pW0nPLD
         HhlECFgdXvNirvUiTxF+LWHsA/QjVFfZlu3XjQa5rFQFMNRjcb10zH+NdQB5OaYgL7i3
         taLOFCrIbdy0hQNxkhXRD5dLtD3V7RlqxVENQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CdJhgQI1mzO90/bv5vr21gO32sraxkNt5npxN7ncfQc=;
        b=VyDKV441qW/F/WARqyQECDEyeRNaGooa4/xfP4DL44Peua9BaxJxCJ+tjnIFdD3L3S
         OzC2gNZFjD+gR4YNsk0qXXJ7Jxqtdp6rxlXHEnP8mkU3MbXZALadtvYLNaVxMp1cnxyo
         OAM5N+c5xDuxIRnV+yzr3bhU6WoM+mHAGBIcjAAtuuIbF785ZDyXfS2yFSKzB0jOX8V5
         SCLzpnYc3LT8fkwED73iNlUvikvPhO2ovxc4xlSCNqGNxd9x2hmWRVZEyQYVvsHAOuZ+
         FIwvLnzAisYjbbB1e9KaoII8qFllU0P9Ov+lfZsAJj/3Y2hxPiS4vDnWuMHTWMrviVoc
         d+ug==
X-Gm-Message-State: AOAM533WfRbr+K+VUJ4lgrYxOin0lOgAA6yJ0IdurCBIzm+V1TctEe+8
	yXZyhg1pXWteO+LVhQqUKH513Hq69yE9Zg==
X-Google-Smtp-Source: ABdhPJw4N9vIbw13D5p46jNI2pvevVZZP9/HyB8m/722Cmr7LCD+XU3+GYKyupqgSF+dXh9HxFb6bg==
X-Received: by 2002:a05:622a:311:: with SMTP id q17mr8389516qtw.418.1642528808873;
        Tue, 18 Jan 2022 10:00:08 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id u6sm11259680qko.83.2022.01.18.10.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:00:08 -0800 (PST)
Date: Tue, 18 Jan 2022 13:00:06 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Vernet <void@manifault.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [PATCH] mbox: Add support for proxied https connections
Message-ID: <20220118180006.7slmzgm6jrvfaeeq@meerkat.local>
References: <20220118174144.2445150-1-void@manifault.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220118174144.2445150-1-void@manifault.com>

On Tue, Jan 18, 2022 at 09:41:45AM -0800, David Vernet wrote:
> The mbox subsystem uses the python requests library to fetch a thread from
> lore.kernel.org, by its message ID. This is extremely convenient, but
> unfortunately doesn't work for users who must redirect their http(s)
> traffic through a proxy to access the internet.
> 
> This diff therefore adds support for querying 'http.proxy' from their git
> config, and when set, passing that as a proxy entry to the underlying
> session requests object.

Hmm... I'm not super keen on this addition, because git has a lot more than
just http.proxy setting and supporting all of it would be a huge pain. Is
there a reason why simply setting HTTPS_PROXY environment variable is not
sufficient for your needs?

https://docs.python-requests.org/en/latest/user/advanced/#proxies

A few observations on the code below, just fyi:

> diff --git a/b4/__init__.py b/b4/__init__.py
> index 11c287e..0526a19 100644
> --- a/b4/__init__.py
> +++ b/b4/__init__.py
> @@ -138,6 +138,8 @@ DEFAULT_CONFIG = {
>  MAIN_CONFIG = None
>  # This is git-config user.*
>  USER_CONFIG = None
> +# This is git-config http.*
> +HTTP_CONFIG = None
>  
>  # Used for storing our requests session
>  REQSESSION = None

We already track REQSESSION as a global caching var, so we don't need to
introduce another global tracking var HTTP_CONFIG (it's not saving us any
calls to git-config, as we'll already only do it once per b4 invocation).

> @@ -2101,12 +2103,21 @@ def get_user_config():
>              USER_CONFIG['name'] = udata.pw_gecos
>      return USER_CONFIG
>  
> +def get_http_config():
> +    global HTTP_CONFIG
> +    if HTTP_CONFIG is None:
> +        HTTP_CONFIG = get_config_from_git(r'http\..*')
> +    return HTTP_CONFIG
>  
>  def get_requests_session():
>      global REQSESSION
>      if REQSESSION is None:
>          REQSESSION = requests.session()
>          REQSESSION.headers.update({'User-Agent': 'b4/%s' % __VERSION__})
> +        http_config = get_http_config()

Here, we can just do http_config = get_config_from_git(r'http\..*') and it
will be stored in REQSESSION.

> +        if 'proxy' in http_config:
> +            REQSESSION.proxies.update({'https': http_config['proxy']})
> +
>      return REQSESSION

-K

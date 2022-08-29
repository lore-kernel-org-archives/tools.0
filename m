Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD95CA8
	for <tools@linux.kernel.org>; Mon, 29 Aug 2022 21:07:22 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id x14so2814224qvr.6
        for <tools@linux.kernel.org>; Mon, 29 Aug 2022 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=VkgtbM1KKNZaAmirDmQCoPeTCiDN/jQ9ueumLBcWac4=;
        b=bCseHpA/KTzSpRMEaoDNIUDscRLOKXDnwFHU/slMMmL8MIMg1ZjBw5y+J0z6jIdSo3
         t5uNbbhkngDSWL6wbT4p9Jp7NvLAmM0+XQ1oODy+H4BCG/vxHUXGn5eaImlxq9i6yS7v
         tjc7h0iMnDIi2V5hY60EiMWlPV5PgAW+FIbxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=VkgtbM1KKNZaAmirDmQCoPeTCiDN/jQ9ueumLBcWac4=;
        b=RgSNjPww/mIxigyzgVGUbSquvmQRBbclhz/J/lFn2+xiiTXeGq4ERagjy9XKfu+w0G
         BkXbUUQ6zHPIGIUTrV7heqEAHYOYDmMaBE08InsPE/FfmopMPYwnJ7nm/zw3eYICK9FV
         ViKGJQrrrq8NMgO5+W4LlbJzQlSTj9rtG5R8i3LZVBDsoitdFr5ywgevmN5NCKyf2z9O
         FBvfSgVNSLe1u6UmrSYcanhopdBXlGYB4kdyaLdA4yTNqDnwmaBJA5dh7NfVFodP+3ut
         UtcS0mpW/S1y2CcIaFGJK8ILIqdAqfzsy3ZIWsThQmGvPmnQl2RYrNAiKaQ6I3KtLB78
         WPWw==
X-Gm-Message-State: ACgBeo20xilbctKgtjHikXbdbanBAj0osS+/DEbv3SdZCILkHwy63zNF
	g2O9gUAdsDOQoWF4C9h7UGjQpxPbH2yRWA==
X-Google-Smtp-Source: AA6agR6p330AEtsE5tSbDiIvJUHbraFH8WAAP5ljrW3AWFYJxn6nbExilq0qPGWYcglAm5RKc4iC1g==
X-Received: by 2002:a05:6214:3010:b0:47b:5759:8be9 with SMTP id ke16-20020a056214301000b0047b57598be9mr12148850qvb.103.1661807241035;
        Mon, 29 Aug 2022 14:07:21 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id l17-20020a37f911000000b006b629f86244sm6507561qkj.50.2022.08.29.14.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 14:07:20 -0700 (PDT)
Date: Mon, 29 Aug 2022 17:07:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: [PATCH] send: Use only the default git 'sendemail' config when
 no identity is set
Message-ID: <20220829210718.xiodi5ff4wfcfqo3@meerkat.local>
References: <20220825182506.1449442-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220825182506.1449442-1-robh@kernel.org>

On Thu, Aug 25, 2022 at 01:25:06PM -0500, Rob Herring wrote:
> With no git sendemail 'identity' set, b4 send picks up all the identities
> and uses the wrong settings.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> This only partially fixes the sendemail handling. If an identity is set,
> we need to merge the identity's section with the default section as an
> identity may not contain a complete configuration.

Thank you for the suggestion. I didn't end up using your patch, but I adapted
it to implement the fall-through behaviour that is compliant with how git
does it.

Regards,
Konstantin

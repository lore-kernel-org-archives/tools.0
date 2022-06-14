Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2377A1FC1
	for <tools@linux.kernel.org>; Tue, 14 Jun 2022 20:27:49 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id 43so7303286qvb.3
        for <tools@linux.kernel.org>; Tue, 14 Jun 2022 13:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FFFHrXFDo/8wqWjx73widgrj7pjh1TYuLmvshO7QJ78=;
        b=Nzqr+ANsKRjkHsFTY4Eci0GilfmY6VinVR6/hRB4yd8uukiOyuh9DfmDIUDwGOnGkX
         oaUX2zu9lKMEF/KiLFjDXSiaVkmY1lb7fnENmv1CgDHfO5myMUfarRN2V+iWPugPqazS
         nfwD4Br08W+PhM5PdfV0P7K+dEbocWsJghY7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FFFHrXFDo/8wqWjx73widgrj7pjh1TYuLmvshO7QJ78=;
        b=vXEV9WQs99kOUEipRINaDjLd5F6GInF5/wjSnth7vxfd3pJzmNV+G+MHTT39pHYFNw
         N84f4z8jVpd5p4FuAqJjGUqCgdPF5uq/1D51mGY5eAPv8hIU48I4JfRP/I2olQ7aWbCu
         IyT0EDRla8Qq03RgQxqgAviNskMQIwHOTSuHKCeihIglp8BKG+zP/L5pRa1J9I6nSMQV
         myj13nnnxy4GnG7u4tSDoR2oPUWKG6RZISk/mfvnMcCMdP0gY745BipUDafAVR86xkfX
         1HGxy2kSoz9Y711V6Bu4Jc51QpS27PbXmOF96AyFSrfYyoH9wal+hgR+MuEdMJKZ7Dol
         prBg==
X-Gm-Message-State: AJIora9vNrTeUKIXzBYvvbMQRuSbAPKntm/GW7VdZwFcSiuj09yEjMMp
	Zg93TC5U921nhpOE2pdQjxB+WRz6cJu3Ng==
X-Google-Smtp-Source: AGRyM1uC+DI+aiShpQa8do26illt9hnhDBI4LkvQZ0ADK7r718Ra+bZ2NbjN30H17TgIUTuFItcExQ==
X-Received: by 2002:a05:6214:d48:b0:464:5048:c14f with SMTP id 8-20020a0562140d4800b004645048c14fmr5152375qvr.125.1655238468017;
        Tue, 14 Jun 2022 13:27:48 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a24c400b006a098381abcsm10426971qkn.114.2022.06.14.13.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:27:47 -0700 (PDT)
Date: Tue, 14 Jun 2022 16:27:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH] Remove URL redirect project lookup
Message-ID: <20220614202746.zlpbdf636uftiehd@meerkat.local>
References: <20220225031135.4136158-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220225031135.4136158-1-robh@kernel.org>

On Thu, Feb 24, 2022 at 09:11:35PM -0600, Rob Herring wrote:
> Now that lore indexes all messages, there's no need to lookup the project
> for the message-id. If the project is not specified, then 'all' is used.

Rob:

Sorry for the long delay, but I did finally get around to it. I didn't quite
use your patch directly, because the goal is to also support non-lore
public-inbox installations, and they may not provide the unified index in
/all/, so we needed to keep the old lookup option available.

The change is in master as commit bfe5df6694c8115fa8402943b125c6e47c8eec08.

Thanks,
-K

Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DB23D3
	for <tools@linux.kernel.org>; Wed, 15 Jun 2022 12:22:40 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id c83so8563610qke.3
        for <tools@linux.kernel.org>; Wed, 15 Jun 2022 05:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ww74Jewzu99vO08fyK7JMC9IuUtiRyR+PULG/B5bK5o=;
        b=D7nM1SdTL3zs7CC8Cj7qnlHPCEZJ7yv5OyQE/k+YQbF0PP1DoEhE1/kHReqjws3pP8
         mfh1iMpltT/NOq2tvaiftfnSKES/DS16hKUYlZG1ZsEzq/RXZ8RuVeGRfW9KOrPXRIxA
         z/JvzI5vArAuRy1Dgfi0j5+WGGO7eE28Ft9C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ww74Jewzu99vO08fyK7JMC9IuUtiRyR+PULG/B5bK5o=;
        b=7V4JUYFWNsEwWrWscoWkcO5+iXQRoTaiEu6yhz/zN7bmFjrYIFALW5wN+bvaaZiNtC
         NHjrKOrepu+9MG2MB8M+hvs2lzEfKT1CB7oh29ue3qNUvTIWbERLNOoVDJtWIXT+aWDP
         OnzlMrQAZalsP11cJuWhQ1SJgkUlsgtKGRLYJ2WhIsudvWPxkg/qi1sQLtS5uDugr+ci
         BKciNhfnAmoTE7cbyh36+QJBk9AYooALgNvyATf2eRHVL6WpNQCiRYqbsNWtF6RT1ndm
         ozHYgH4FT1Ypoh2YUM9DE0nakygjwXIwzkmCoOlt005cLJ28zD1OS4JuEVgqjNAVFDn4
         5mXQ==
X-Gm-Message-State: AOAM532iXsWa+hTTc9Hxk35YTHrtxfrtgSvrT9mHNRDB5jdco8ygY+kE
	hakx4nV0DNDx+GppCBLsgPNX6w==
X-Google-Smtp-Source: ABdhPJx7RDSKYYjj3OLTeIj/B41SYQkTyXlB19SDZZpweEkwLUOqNm714Y4RFIB5BARHgXhvwnrDTA==
X-Received: by 2002:a37:9ecb:0:b0:6a6:a6e4:fd47 with SMTP id h194-20020a379ecb000000b006a6a6e4fd47mr7959697qke.708.1655295759062;
        Wed, 15 Jun 2022 05:22:39 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-245.dsl.bell.ca. [209.226.106.245])
        by smtp.gmail.com with ESMTPSA id m4-20020a05620a24c400b006a098381abcsm12354120qkn.114.2022.06.15.05.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 05:22:38 -0700 (PDT)
Date: Wed, 15 Jun 2022 08:22:36 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 Link: trailer disambiguation poll
Message-ID: <20220615122236.padf7qoqyjcekwjz@meerkat.local>
References: <20220614213955.eyex4bekp44iroud@meerkat.local>
 <bfae56be-bab3-05a7-633c-c6387e61392c@redhat.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfae56be-bab3-05a7-633c-c6387e61392c@redhat.com>

On Wed, Jun 15, 2022 at 10:58:36AM +0200, Paolo Bonzini wrote:
> Why not just add "Message-id: <...>" like "git am -m" does?  It is an easy
> step from there to a lore URL.

I think mostly because if we're already sticking a long string into a commit,
then we might as well prepend it with https://lore.kernel.org/ to make it
trivially clickable.

-K

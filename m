Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C45172
	for <tools@linux.kernel.org>; Mon, 21 Jun 2021 20:03:28 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id f70so33560359qke.13
        for <tools@linux.kernel.org>; Mon, 21 Jun 2021 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W+ekpIjLWYj+PzbhvNdJ85GgAwXDUo3INpJc/s6TFxU=;
        b=B6mtuXOk8mlRpDf1bEf3VAz5iVeGKZMKfUR9vVAoqA3Lt5qLLh3JlsltAcELRXAXQo
         4UZ2K5fstnkvJ69rdgQ37uW+uQP7DsmzGKlDsByLEmxZXa8AyRL4/OP/Rejh8y262ei2
         rx3DBiTq1xXw79apnlcZhesqS5Emy0RsH/Vlw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W+ekpIjLWYj+PzbhvNdJ85GgAwXDUo3INpJc/s6TFxU=;
        b=QKrIc3u6Ropx1S1iO3IVKwyICsdh3pR3xYiSTbxXR8fCVXjeN84LY3NzWbzjQir46k
         A1UzqGFqDofJlG2mUVSbJXm5DrPXnjb2e8DSDGh9lg9UWXWKwLZRMFiurzPcdXRPGZ3M
         7wKF4OHiYxW7OPyaOZTDDNMxvXxj6Kee2A9cUYPNk7MTy+viVByqIF6zquMOXq2Gd6P0
         OKMV7Kc3X7QyfpROtIo4ZXKUuLYY6EaysFk3UoQyqtfDKzWZYmtpqD1A765weP40Uifs
         I3ginjLWEtXD6hb+yUTjsqRqrg5RiT2IaHYsolflAJOtivoaj2ko3fL/uLNDpE5vDdPm
         aJnA==
X-Gm-Message-State: AOAM530fvka3GygWUElGOPacQbhFH41DkVA0kIt5EkPVR0JxdiJg0QU5
	Kke3/J+WFSEnwgmFcAwytdiPzuHe3NlkRw1l
X-Google-Smtp-Source: ABdhPJw7KCcn+ckIVe5hsC9Qi/d/dkC8q/rZdOBDLNay6bsagNe+/dzo1hheOgy6qQjqgqDH8S6o6g==
X-Received: by 2002:a37:9e53:: with SMTP id h80mr401924qke.150.1624305807273;
        Mon, 21 Jun 2021 13:03:27 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id t139sm10724052qka.85.2021.06.21.13.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 13:03:26 -0700 (PDT)
Date: Mon, 21 Jun 2021 16:03:25 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: tools@linux.kernel.org
Subject: Re: [PATCH 2/2] am: Allow specifying a base to check applying series
Message-ID: <20210621200325.zgz4eibneuchus5d@nitro.local>
References: <20210618182452.2577871-1-robh@kernel.org>
 <20210618182452.2577871-2-robh@kernel.org>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210618182452.2577871-2-robh@kernel.org>

On Fri, Jun 18, 2021 at 12:24:52PM -0600, Rob Herring wrote:
> Add a new option, '--check-base', to allow the user to specify a specific
> base git ref to check applying a series to.

I just pushed a reimplementation of --guess-base into master -- can you see if
it does closer to something that you want?

-K

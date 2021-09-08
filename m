Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B372
	for <tools@linux.kernel.org>; Wed,  8 Sep 2021 13:12:01 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id b64so2467622qkg.0
        for <tools@linux.kernel.org>; Wed, 08 Sep 2021 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=M0zZ+/nvxDz+vI3Ojz67h6I7L7lG7ODLvpsyn9Z531w=;
        b=C6gSwraBmPoBr3SZx02IyqjrY5CfJtFkEG+z+dNddS21i8fQWtZkvzYLNUchoTJ6re
         +bEAa1LvjS+ZYrnlQOy9I6co+L4B89Doy+PUYjZPpp0hhbHJCmTMVnduLSKJqbqXA5Hk
         QosCx7mitioMOk0PHSCcMbMnj9efyfRDXu0sk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=M0zZ+/nvxDz+vI3Ojz67h6I7L7lG7ODLvpsyn9Z531w=;
        b=fCG4hUGDdSELso32fJbplN6lUX3JX3ikfcEanOmUoNuCmwLEgfufp0F1Mss+WueILE
         X03DCvsOU/ACJAyPJvV+wKmNVXP5W20ZjnHOO0iya6wIyl9d8XLOnWTMwgGxGkkzPRVm
         0Fum8AOAwPsDt4go7hx8KUXObgM9LNx9qkEH2yD7wYVrXtvR6DWHS79fVU8B9YVlqKIA
         o5QF8ZwI0PYVks8xN9W7bmwJ0cvFwwtueANUT9XGaHFDj594NYxMJYRAjXBNOcB/UK2f
         N7ofe0COSeLhLz5Q4E2+CYI/0ytKKN0jzBJZMsJ8YZQHZMJzgJCSKSn5oLq9Clc1iyLJ
         HPUg==
X-Gm-Message-State: AOAM533PndYeMV+IEiom8RucYc5pS7fT99Ue6ssyF/cu8sIK6gwqqkwR
	nnIFlYM9jun8BiZ9/HbNS/ruUw==
X-Google-Smtp-Source: ABdhPJwTakdeiG/xDJz56e/rY9v1hdNn6WoyOXeKhcEIsdsuui4Y5rX1hW/Ml0Pg16vBn4hDPe5S1Q==
X-Received: by 2002:a05:620a:31aa:: with SMTP id bi42mr3291483qkb.425.1631106720457;
        Wed, 08 Sep 2021 06:12:00 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-32-216-209-220-181.dsl.bell.ca. [216.209.220.181])
        by smtp.gmail.com with ESMTPSA id i16sm1440423qtq.52.2021.09.08.06.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 06:12:00 -0700 (PDT)
Date: Wed, 8 Sep 2021 09:11:58 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Saurav Girepunje <saurav.girepunje@gmail.com>, tools@linux.kernel.org
Subject: Re: b4 and lore and '/' in a message id
Message-ID: <20210908131158.it5lhuxyc7arw4uv@meerkat.local>
References: <YTcJNrbjTVMXCQUG@kroah.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YTcJNrbjTVMXCQUG@kroah.com>

On Tue, Sep 07, 2021 at 08:39:50AM +0200, Greg KH wrote:
> I've run into problems with a specific user that happens to send patches
> out with a '/' in the message id field.
> 
> I think this is a valid thing, but b4 and lore don't seem to handle this
> very well.

The latest public-inbox version allows us to do the right thing here, so
things work as expected now:

	$ b4 am YTRuXTu/kePBDwAF@user
	Looking up https://lore.kernel.org/r/YTRuXTu%2FkePBDwAF%40user
	Analyzing 5 messages in the thread
	Checking attestation on all messages, may take a moment...
	---
	  ✓ [PATCH] staging: r8188eu: include: remove duplicate declaration.
	  ---
	  ✓ Signed: DKIM/gmail.com
	---
	Total patches: 1
	---
	 Link: https://lore.kernel.org/r/YTRuXTu/kePBDwAF@user
	 Base: applies clean to current tree
		   git am ./20210905_saurav_girepunje_staging_r8188eu_include_remove_duplicate_declaration.mbx

Best regards,
-K

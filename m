Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7E033E9
	for <tools@linux.kernel.org>; Tue,  2 May 2023 17:13:22 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-74e12e93384so177370185a.3
        for <tools@linux.kernel.org>; Tue, 02 May 2023 10:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683047601; x=1685639601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viH6GOcRm/gYzO2qWI4n4hh2NppPj3/HJ1siu/UBpMs=;
        b=Zk3/6izGtcZ2ZNIHg0+RLzBMVUmbYZDHbk73MCo3HJNQty+4iXHTohwTjoW92BFMX5
         Z18OZIu2JCbFwkPy8mAoGTGxfJRQyDWDAAKQ0LcJ5jK0LcXyDTcIiKgABvjvSxgNMjAL
         u2c+DSnExnP5MHzVywhecHe5fyw8z+vpuRYXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683047601; x=1685639601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viH6GOcRm/gYzO2qWI4n4hh2NppPj3/HJ1siu/UBpMs=;
        b=bhnL/daCE7gws3NWzIJ0XiyLHP9SU/Zs9iCXSgAg7D4HKCrKw8tHp2K7audGyIJIYy
         Y3Oakk+WHjtkKCfun+YqcAE0HqVFf7AsoWl12DSIwVfJya3i4x7vSSgk5Z9ytzkv2P5l
         KKy6iIU7um8DZzW4WnJkxt9xb37LFg0xx8N5QR02MxILVaH91oVZJ2EwTTtQDMTQnOTI
         HZ/Zm1LToyoHVynikkDasJg6qkAXgFuV59A2daU2t9TTW9MMj81IoLgcMd/SiyxMHd1S
         ugDGmRqt1jypHrhXoXyehwG+efDcP1FBMuz6CJT/2fUfWDcjmdsT6QyOa8R3NLZrtAdF
         gBHg==
X-Gm-Message-State: AC+VfDykHobaUkw01UaRqqTXJFAITvFT2vPyvSf+jFqrwIpXVY/BBAU9
	3NOUaCzJUC2cEcEAoZ9Bx/JTyA==
X-Google-Smtp-Source: ACHHUZ7Zl7keh9qrO/2X5FIYiWt5E/TEdxVDDDFQ8rRX76xHjSX3kUC7lXP2IvV1a6kjvzCm4naFnw==
X-Received: by 2002:a05:6214:411e:b0:61b:580c:8ef6 with SMTP id kc30-20020a056214411e00b0061b580c8ef6mr5270382qvb.36.1683047601591;
        Tue, 02 May 2023 10:13:21 -0700 (PDT)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-132.dsl.bell.ca. [209.226.106.132])
        by smtp.gmail.com with ESMTPSA id o11-20020ad443cb000000b0061b63237be3sm263458qvs.131.2023.05.02.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:13:21 -0700 (PDT)
Date: Tue, 2 May 2023 13:13:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 shazam in a subdir
Message-ID: <20230502-piper-tulane-log-af0fee@meerkat>
References: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e4757cf-7351-9aff-fada-2b03ff82b2dc@citrix.com>

On Tue, May 02, 2023 at 06:06:15PM +0100, Andrew Cooper wrote:
> Hello,
> 
> When using b4 shazam in a subdir of a git repository, you end up with
> the patch(es) applied correctly, but also the diff structure expanded
> under the current dir, and the working tree dirty back to the state
> prior to applying the patch(es).
> 
> Running from the root of the repo leaves everything in order, but it
> would be great if b4 wasn't sensitive to $CWD inside a repository.

Thanks for the report.

bugbot assign to me

-K

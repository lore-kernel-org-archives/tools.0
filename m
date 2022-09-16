Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1C25C81
	for <tools@linux.kernel.org>; Fri, 16 Sep 2022 16:24:21 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id c11so16314397qtw.8
        for <tools@linux.kernel.org>; Fri, 16 Sep 2022 09:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=uxYIP3SArsRKDmoJqXSpC6eCkQ4alJVC93pCThzRHIs=;
        b=JVu657d7+d5mo11ZA1RTf+cqriAe3Ag9X7L3EfiOtGtH2HGVLjEAqbNcA3o0wYrWxK
         3I+bH470YcEEXZlgD2PqQboYhXFjEghPhO+J0njc8SiE5+ZdlQgJRKnlwwnhEzRyuzuB
         ResJIIFjaCp4h/7N8/YwDrd0syTR/7J81NZGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=uxYIP3SArsRKDmoJqXSpC6eCkQ4alJVC93pCThzRHIs=;
        b=E861fEknhLEHv4rtQrfExmGY8nsEGipo/lNzznY4V+zNylhPdBLjHID45ruBiGAdgc
         6F8/xegwwfP6wkjN1UgaFsfkeph990iHolpcxU5M4JWhI5x6wwZyRdTAxRuD1oCL5AeE
         kCOVAfU7vUS97mhRVou+6sha9uO6xPAmakkkdGjS68CEN7amys8sGwlJrEnkm8WRq4+V
         dsgOTX7s+eJYbfMR2QOcsdRXlKJsWB89y5qeHjv2GJGiiMFXPYOr8MTEzwmlNRTUCE4a
         YApvgtb8vfj/YBOfd/FsQn9YwWXDZY/WyPyHfodY5xPGpONPF2ZYHBA0FWIGwxcP0GzQ
         YSLg==
X-Gm-Message-State: ACrzQf3denEryb5xBXoPFK3C+7CNjeNiYecMbqNI+WrC/+AKai5G5cej
	7bMUSrEYEn34Mni3nvXsabjKCg==
X-Google-Smtp-Source: AMsMyM6w3xleguXZbXJN7IR7LJS8ChcHp5SbZtb/eh5zIRFWih63Icrd66XIGVEDTfQO6/VjJpOoVA==
X-Received: by 2002:ac8:5a16:0:b0:35b:ac5b:36ed with SMTP id n22-20020ac85a16000000b0035bac5b36edmr5025202qta.431.1663345460017;
        Fri, 16 Sep 2022 09:24:20 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bs14-20020a05620a470e00b006b58d8f6181sm6466165qkb.72.2022.09.16.09.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 09:24:19 -0700 (PDT)
Date: Fri, 16 Sep 2022 12:24:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: tools@linux.kernel.org, lkp@intel.com
Subject: Re: trailers update and bots
Message-ID: <20220916162418.plk3jhc6hezv2ace@meerkat.local>
References: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220916161835.mpi5oyeka3b4ellx@ldmartin-desk2.lan>

On Fri, Sep 16, 2022 at 09:18:35AM -0700, Lucas De Marchi wrote:
> It looks like there is an incompatibility with b4's updating the
> trailers and bots sending "found a bug in your patch, if you fix please
> include Reported-by: ..."
> 
> Example: https://lore.kernel.org/all/202209160835.MMBeObmU-lkp@intel.com/
> 
> Now if I update the trailers, it will look like the patch itself was
> done because it was reported by kernel test robot, which is not true:
> there was something wrong in patch that needed an update.
> 
> Should lkp (and bots in general) escape the line "Reported-by: " that
> looks like a trailer, or should/could b4 deal with it in a better way?

I'm not sure there's a universally "better way". One thing I considered is
adding an "trailers-ignore-from" setting that would allow you to keep a list
of trailers that should not be automatically inserted, e.g.:

    [b4] 
      trailers-ignore-from = lkp@intel.com

Would that be a suitable solution?

-K

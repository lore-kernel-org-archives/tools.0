Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40518273811
	for <tools@linux.kernel.org>; Tue, 14 Oct 2025 18:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760465151; cv=fail; b=j2Cu+Ftwt8bCBwypOcZVdf84TptUpbjw5lsOOEVGhXiDWKU+beIGTSGcDDDsFz8HhN6XVhh+qqh0J59QWU9QlX4R8g/8S1R7vxBaOQMXKiNPe8O4HY14hWvIAuv/7YkJkbtrXWaykryr/9DPn5367rkB0PdXhkXilmCpYFbDsEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760465151; c=relaxed/simple;
	bh=/2g64aQejZZLO81NPJ/RU4CrWRXIRt1elcgJXMx43sQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=D7twtUyHW18fI/DwRlhMtFuPQJhjc5i9BDS5fBmquwv3jEupDSvVB8Y9jzR7rBvNXvCncfksBzTxmr87bL7Ch91tFCcEayficwx4vDjSbRjVUBI78aXhuqPZWvecBRWuhxwaH66UhRzDwiOrNnQdgJhlNNU4zeNNcVYewXDlv6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzHqi3ZF; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzHqi3ZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760465150; x=1792001150;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/2g64aQejZZLO81NPJ/RU4CrWRXIRt1elcgJXMx43sQ=;
  b=LzHqi3ZFT2aKs+ZSNPbpDwH08EKMCoRj4pcow9iyfYj/fh2qj75V91mB
   F+AH8PDtsbH6WrEK6DcywnHS4XZbOeKE/2rmMxXlAAaQcCEQZa5EauDxH
   7XnokJjTZu208lEMaZavuD09nAFWdiGtPsHtt3ur6lLKoW/lfa7+GAstm
   3F1lOuJqagAiTwEbnktnOg1CSJOUXKY5L+gRP/DIT1mwGoKvpcd1qKUYE
   Kh1A+fQqt/jVHhxyP6Thyv/TAFfq4lSSsQfzSMbDlslLupTAiVK9YWjH9
   I8U0n+ZmzIlWEhsANNQ27kKdn3gZ2zL/S4OMjSWij8nA+4dPnfoi/hf36
   Q==;
X-CSE-ConnectionGUID: sRctoYCWTiuEREJiQo2fPg==
X-CSE-MsgGUID: 5eC+utVUSg+A9dIxR9O47A==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73735270"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="73735270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 11:05:49 -0700
X-CSE-ConnectionGUID: 4C1j1KM6Tt2htmj/ccIQDg==
X-CSE-MsgGUID: frsIUqXxQ4e0zv7XgAKMCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; 
   d="scan'208";a="187042902"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 11:05:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:05:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 11:05:48 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.54)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 11:05:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chFJ0iZdOJywe61E05mRpt0ZgQtTu3wYlsKC+Aw0bXK3ziZLmD2BtLahsriUIXY9j9xfOVrzEag5TvmuRhKsBQNH+VNqbTGfHHqG4vSuPfnudt53JIopEQfPUFJFOKvxI5pLUW53gvr7IiQoMFMxOwajREdoUmeUwnOFWJdb/pMv6bncs1SUS9/P8zIqnbe/8ZJ1FYAj2QorzrVD/+hMa64PiekazL2L6epnZNGG2/YJoIaBvRDzKoIkQEkAhruUNdrkvTNBezUCroCt1SHK0xZ/HsB+Tle6YHTLCiC3YlDGd6OKjW982XVfi6npWxKagLbgg/5LI4OiRtZF9GaCvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAI7grJ5Y3qQXgwfM3RVhNA8fnaw2E+qx2LRSHXYOZ4=;
 b=DYKaZwZsP/iiCFRXGCD2OTt9nrWIQT1mLa1yA18DR7i3FEui6eG7JyUada0Xdo4rQ9FolM7djVx5cYvF+qCJU4cZpOKvqJIZnd3qGPEL6NwJgI6PTKT9nE1gbbu9/rA75WgmW/WNsDx7sSlVgzLt+WiTgcUC2tr3+hOKvXZHszPC34qqtWPG6wHDJ1JMZq5ACtvMwHTz5D6Kay1bGiYIWeBiyNlEbT81QhgnnDpSXK8C0sEpMNhF83W9MIsu055i1xasuT3nRIyhktA2vuKwQQl3xaCgPB8bjdVmrbhyyNLW5iqTk5jOZTvIa20ELeEr5K1Ab30p7yAJZ45IibKHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS0PR11MB7927.namprd11.prod.outlook.com (2603:10b6:8:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 18:05:38 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 18:05:38 +0000
Date: Tue, 14 Oct 2025 11:05:36 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	<users@kernel.org>, <tools@linux.kernel.org>
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <aO6Q8A5DKNA-g1Fa@agluck-desk3>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
 <20251013081536-mutt-send-email-mst@kernel.org>
 <CAHk-=whSShtPG1_+02Cc4yDuEJxVqX=G8tAx0gW7UjA7cuBp-w@mail.gmail.com>
 <20251013190418-mutt-send-email-mst@kernel.org>
 <CAHk-=wjioLpTroP=5cUQsVmDb3BtKnn5QToBX9Qy2dv_VYTZ0w@mail.gmail.com>
 <20251014062426-mutt-send-email-mst@kernel.org>
 <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=wj1rRqLm0upJVx-EPR_rN8W37kKTgzUSONUbm74mJhwig@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|DS0PR11MB7927:EE_
X-MS-Office365-Filtering-Correlation-Id: a3b48b56-af5f-4ef2-5f09-08de0b4c478f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ds4Xc54Qkd1sbMUKcBqJL3kS2xBdMcJ52W52RB0AifZ1EQ4EyKYHYFoIweQ7?=
 =?us-ascii?Q?sy/us8Y20lQEQSylResYTpw5iykLCmhJNOG6smF8g4pLWOB2vqa0/luav75v?=
 =?us-ascii?Q?3xui+A0tVjuSbs0FVv71/B0CZJCEWITij8aynX7XbeJJSAAYFWRZOwvC3hIG?=
 =?us-ascii?Q?VdwlPNhj1JetthQkial1SVEgxVxB+7TuMJ/WSe0j1QTAsMHnvbY1TnKbvG7h?=
 =?us-ascii?Q?Nl3l5w3w7fOOatLeuVqPjvEMKSYnFYOEIhVlUq3+91TLKLCs2RBy8aqKJIGz?=
 =?us-ascii?Q?QhCvhJzYjFj6p5RJR7y1abh49tVgrMsMQfA+ZjcxEaPLK79slvYg/7RuuxUC?=
 =?us-ascii?Q?BPjj/8MCBlsw5UEpA36qcjtE3jEAplAgtm2DSllgAuD+6S76CVq+VhLHxyYl?=
 =?us-ascii?Q?pkb7Ffx8ziMzTTo7VIgfBpHRLwLWmvfH0Jc9LrRR/1RiAWwqjPaj5kuL1yLZ?=
 =?us-ascii?Q?Kr6l74JUir6DcZoXSSmcHv/aUFn1PNI2jRr1dVSdWJtDIUmz/UeYASIC+s6J?=
 =?us-ascii?Q?43a5HpZoYjmXXNWcFLvKUop+w3YrLdV08Rw2bC4bGx6nvMtH9bY6B4p8A7HX?=
 =?us-ascii?Q?fqdfua/fbEzCe40jOsFHobjqNpgr5e5OOoTzL6ADKeGlTmpu7B87BeEA3qZ2?=
 =?us-ascii?Q?FaR/pRyomgJqVRWR7zz+KED9fbXEr+GhFWHwUfOpn21cPw7Y9sThy1Z1dYe9?=
 =?us-ascii?Q?PgaaU+3NyCV0V1yTzd4pl7YsCvLEgtZUJcD8ff0f5RxlH4CGl9PfUkGuz5T9?=
 =?us-ascii?Q?QrMTynvtkklPjWhdp9+C/jhSYPjBCwHJzgl0b+7JjiqmPk+7HhNAOOogaJH/?=
 =?us-ascii?Q?vKopt+9M1rXHvdePbESwVkf1hqneiKxtQn343qrsTnJvbXzadh80JLmdH5Dp?=
 =?us-ascii?Q?cRUiiKzTY4HgeEtYJuA6iqCLVvqJOrZ67IXgYXj09iTMrYarNPJZbTGk5r3Q?=
 =?us-ascii?Q?omkLKqokgFOugpIVzuCex0O6qNk5NRqop/0idfoHD2o8CONutDtb9LjzXNt4?=
 =?us-ascii?Q?LauqLEkWR5Eu22WfZYDnAW6yDmi3KnSu45Zbvjyt1sB3jTp0YQ1Qvc6cP/k0?=
 =?us-ascii?Q?NzGcDTUTuwRuWheZNDBdNbiZzHcp4kuplLLKZEO6R8vORhAEmWilRraArIrX?=
 =?us-ascii?Q?OUZ0Ze3tu5r+wingckOFwczeiwFADXIDBwCDnTpWetFjUw5S4SS2F71/n81B?=
 =?us-ascii?Q?six33SePrAXR1la7LY19jwbmd9pnBCf6zaSrV1/8HVjEId5QdWYbv0DG/UjQ?=
 =?us-ascii?Q?Ysha/TRH3MgWp4jG9STgj5I65ACO4SOa6FKzqSI+BEpYpbEb+/PtPGdbQII8?=
 =?us-ascii?Q?ThFFG8xig+8pg6/H9fHD3o1lyIGtD41BW8/QQAGtw+5evD7gNGnWU1WVjMcD?=
 =?us-ascii?Q?a4vqtCBNVapP+IczqgXzhTd9Gng3ikfXGcuHo8B8iYqHVg4yoP/AOZBOQs18?=
 =?us-ascii?Q?23Vz5J/Noco+6FbU5clI17RyvHF8AqTN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CgYnkCsB3GpDMHgpi7xuYsEsowSP5Iz/gZDqFtbukmVMAt1jjqWNl4ttgqui?=
 =?us-ascii?Q?WRsqYlNgWsrBYz1g8H1VQZ/RhMFQo4a0mV42Pc3n+IFthk1y6lHUPFSHqyuE?=
 =?us-ascii?Q?l4BLTuAOtJpH5DtMEEjxNFPVQ5vwruJljYig9HF3wyjRFjx2HUnXfTfXE6d1?=
 =?us-ascii?Q?xuY3bLDHRJPIiWGAw7ApIrZzwjUvLxqlWFqkMb+lNfpm06hu9JyLo32J/4pZ?=
 =?us-ascii?Q?WfG8yNZiDrbsCILFPJ9w0+Wp89wcilLzUnlgBCjYOG+nmSJoU6BbCU2nrCY+?=
 =?us-ascii?Q?IR+c/HeDum7Jf9Tn0dUMWH8tkibA+c+YXAstJNOPJJQPERb5+VBTQp/VsvAM?=
 =?us-ascii?Q?+Hz5qfA7WHIMJhXh4EdI9UwN2uBKNfb9p0F0hvOtgKJdcSLpshxU/cMzy1QI?=
 =?us-ascii?Q?jOkBvwDUJ0xMnUbeL0XpOjTplv46krAru93dEbeDMlPy3md6FrxqmfkHx7iX?=
 =?us-ascii?Q?VEU+KntH5u6mgYjzbWPgWT9pO5Swxxa+Fby9PpD5SXKdALsT57/+ly1JZ+v0?=
 =?us-ascii?Q?06fzbXxlpj58r6pkz9Fa5hN2yt8gHcCrnp5F2h4S0gp5k3I/tCMqfpyJeMdT?=
 =?us-ascii?Q?gG19NGJ4jxbJj7yqF5b3pyYI9GKScaN9YEfCABPLE5F8B9EgEywUkXhHM6+9?=
 =?us-ascii?Q?w+Hq/GffBicKAaq8f6JNwqmeVzfioVqQa43VzyY2tK6nvIhxKda0dMyVGdgq?=
 =?us-ascii?Q?6x6xqMQ/WLvBVXwK7Gb1Jj/+YmllQs8JRWofalNCJ19Xf9rkq1OrfHM14w2o?=
 =?us-ascii?Q?MbuYMb8uzWD8Zq2+0Xc9j63QbsgLCnE5Oeun4vYclLTrU03q8IDoo8NpGJUA?=
 =?us-ascii?Q?txoifEbMszOU6QBU4AHr1DOuco7aGypBKlBfQnw//YPetpi88dbkZZaLU6oN?=
 =?us-ascii?Q?5yf8ZL8wlfFcmjb8UnIFWvQQINTG0UgNEhb8u5g/eN65q2AefFQWXcOmmo0O?=
 =?us-ascii?Q?T6aQvcdIbzYsomAVomJfhhPWP+fwAi/J+65hPeFo6GqoK5JYGomtxfCpimj2?=
 =?us-ascii?Q?x1cF7YMm1/eI8xSnUwVrX3bSf+okh8Mt4vUON4zIu5h5Nb9J6T9UCGOZ1Zcm?=
 =?us-ascii?Q?jmgAa2h+DoradPh2qX7ebygw3DxSAipm8IrXzK3Mbv6ySA6A0dy/KlxlRRvu?=
 =?us-ascii?Q?nd41Mg5p4T0PXC2+ay3BwiaB2CAE2+DerMGQOoY/PNQ4cWv2lWqYeF06+Bcm?=
 =?us-ascii?Q?32pwP1gJd4P9YyZ3a5hlgl53ezn8KiTEUmA8TrY9JtrWmTLShscdyJdc5uBj?=
 =?us-ascii?Q?T9+6wfllDdM3ikCAqIiJ1+3PJgbHNDoV1mtZ1baekMR3gM30jdZHd8SuwwfK?=
 =?us-ascii?Q?mKFBl9/N1AU2Y7BzNro1KjGNl8mahqU+oAvhySVn+HAadV4+PJ/8GQXhTjA1?=
 =?us-ascii?Q?vQwYtTbejySmJUdPlGFc/57pTe/ETCzHgoaJUQko0b/Oewq1Z0DAvhNPSmTe?=
 =?us-ascii?Q?ZcDztaDdj6D6r+nFFgD/pxqE4xek4Xj+ZUythWVOScovSXXXWN6F8a7UCs5+?=
 =?us-ascii?Q?wwp0obqWHOVFCtyYYk26lkztneOw2Pku8LXZasaaDxCFF6gdaWuSzwExkx9M?=
 =?us-ascii?Q?azL85STwGjslClxCCfv6AelyTF//YmWRGlU8H72L?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3b48b56-af5f-4ef2-5f09-08de0b4c478f
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:05:38.0798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +T6mSeqwJkXf7gg6qQYsbllhTb9UWwWsCFJLx9k6VhdlPmZFJSv5DIeJmE7ArOXHmVrCxk7P1fxepZWcRHCD8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7927
X-OriginatorOrg: intel.com

On Tue, Oct 14, 2025 at 09:56:02AM -0700, Linus Torvalds wrote:
> On Tue, 14 Oct 2025 at 03:38, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > What do you suggest then, if not reading all of commit log
> > and also not looking at the date?
> 
> I think we're talking past each other.
> 
> I'm not saying that you shouldn't look at other things. I'm saying
> that the patch being identical is the *primary* thing, and that
> earlier submissions of the same patch are very much relevant.

While there may be many archived e-mails with the same patch-id, the one
that was actually applied is "special", *if it is part of a series*.

An automatically applied Message-ID (whether a clickable link, or just a
raw message ID) gives a pointer to the specific e-mail. That contains an
In-Reply-To pointing to the cover letter.

So this 0005/0045 patch might be the same is six different versions of the
series. The other patches likely changed (hence new version).

Anyone looking to backport this patch won't care about the identical copy
in v2, v3, v4. They need the specific one that was applied to get the
surrounding context.

Someone who bisected a bug to this commit, can reply to the specific
e-mail that was applied (thus getting everyone involved in the original
submission into the e-mail thread).

-Tony

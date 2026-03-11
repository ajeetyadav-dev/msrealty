# Property Form Complete Flow - 99acres Style

## Complete Step-by-Step Flow

### STEP 1: Property Type Selection
```
Select: I'm looking to...
├─ Sale
├─ Rent
└─ PG (Paying Guest)
```

---

## STEP 2: Property Group + Category Selection

### IF YOU SELECT: **SALE** → Then **RESIDENTIAL**

**Visual Category Cards Appear:**
```
┌─────────────┬──────────────┬─────────────┐
│ 🏘️           │ 🏠            │ 🏛️          │
│ Apartment   │ House        │ Villa        │
└─────────────┴──────────────┴─────────────┘
┌─────────────┬──────────────┬─────────────┐
│ 🏢           │ 📍            │ 🌍          │
│ Ind. Builder│ Plot         │ Land        │
└─────────────┴──────────────┴─────────────┘
┌─────────────┬──────────────┬─────────────┐
│ 📹           │ 🚜            │ 🏰          │
│ Studio      │ Farmhouse    │ Condo       │
└─────────────┴──────────────┴─────────────┘
```

**When You Click on a Category:**
- ✅ Apartment → Shows bedrooms, bathrooms, balconies
- ✅ House → Shows bedrooms, bathrooms, balconies
- ✅ Villa → Shows bedrooms, bathrooms, balconies
- ✅ Independent Builder Floor → Shows bedrooms, bathrooms, balconies
- ❌ Plot → Hides bedrooms, bathrooms, balconies (just area)
- ❌ Land → Hides bedrooms, bathrooms, balconies (just area)
- ✅ Studio → Shows bedrooms, bathrooms, balconies
- ✅ Farmhouse → Shows bedrooms, bathrooms, balconies
- ✅ Condo → Shows bedrooms, bathrooms, balconies

---

### IF YOU SELECT: **SALE** → Then **COMMERCIAL**

**Radio Options Appear:**
```
[ ] Commercial Office Space
[ ] Commercial Retail
[ ] Commercial Land
[ ] Warehouse / Industrial
```

**When You Select:**
- 💼 **Office** → Shows office setup fields (seats, cabins, meeting rooms)
- 🛍️ **Retail** → Shows retail details (entrance width, ceiling height, washroom)
- 🌍 **Land** → Shows basic commercial fields
- 🏭 **Warehouse** → Shows warehouse specific fields (electricity load, loading %, DG backup)

---

### IF YOU SELECT: **RENT** → Then **RESIDENTIAL**

**Same Categories Show:**
```
Apartment | House | Villa | Plot | Land | Studio
Farmhouse | Condo | Independent Builder
```

**Additional Fields:**
- ✅ "Willing to rent out to" section appears
- Shows checkboxes: Family, Single Men, Single Women

---

### IF YOU SELECT: **PG** (Paying Guest)

**Fields Shown:**
- Sharing Type (Single/Double/Triple)
- Meals Included (Yes/No)
- ❌ Bedrooms/Bathrooms/Balconies hidden

---

## STEP 3: Details Based on Category

### For Residential Buildings (Apartment/House/Villa/etc):
```
✅ Number of Bedrooms (counter: 1, 2, 3... up to 20)
✅ Number of Bathrooms (counter: 1, 2, 3... up to 20)
✅ Number of Balconies (counter: 0, 1, 2... up to 20)
✅ Furnishing (Unfurnished/Semi/Fully)
├─ Furnishing Details (if semi or fully selected)
│  ├─ Lights count
│  ├─ Fans count
│  ├─ AC count
│  ├─ Beds count
│  ├─ Wardrobe count
│  ├─ TV count
│  └─ Checkboxes: Sofa, Fridge, Stove, Washing Machine
✅ Additional Rooms
├─ Pooja Room
├─ Study Room
├─ Servant Room
├─ Store Room
└─ Guest Room
✅ Reserved Parking
├─ Covered Parking
└─ Open Parking
```

### For Land/Plot (Residential):
```
❌ Bedrooms - HIDDEN
❌ Bathrooms - HIDDEN
❌ Balconies - HIDDEN
✅ Carpet Area (always visible)
✅ Built-up Area (on demand)
✅ Super Built-up Area (on demand)
✅ Floor details
✅ Availability info
```

### For Commercial Office:
```
❌ Bedrooms/Bathrooms/Balconies - HIDDEN
✅ Office Setup
├─ Min no. of Seats
├─ Max no. of Seats
├─ No. of Cabins
├─ No. of Meeting Rooms
└─ Washrooms (Available/Not Available)
✅ Office Features
├─ Conference Room
├─ Reception Area
├─ Pantry Type
└─ Lifts
✅ Commercial Details
├─ Fire NOC Certified
├─ Occupancy Certificate
├─ Lock-in Period
├─ Escalation %
├─ Loading %
├─ Electricity Load
├─ DG Backup
└─ Building Grade
```

### For Commercial Retail:
```
❌ Office setup fields - HIDDEN
✅ Retail Details
├─ Entrance Width (ft.)
├─ Ceiling Height (ft.)
└─ Private Washroom
✅ Basic Commercial fields
```

### For Commercial Land:
```
✅ Basic commercial fields only
❌ Office/Retail specific fields - HIDDEN
```

### For Warehouse/Industrial:
```
✅ Warehouse Specific
├─ Electricity Load (KW)
├─ Loading %
└─ DG Backup
✅ Other Commercial fields
```

---

## STEP 4: Media & Videos
```
✅ Images (can add multiple)
✅ Video (YouTube link or upload)
```

---

## STEP 5: Pricing

### If SALE:
```
✅ Ownership (Freehold/Leasehold/Co-operative/POA)
✅ Price Details
├─ Expected Price
├─ Price per sq.ft
├─ All inclusive price (checkbox)
├─ Tax & Govt charges excluded (checkbox)
└─ Price Negotiable (checkbox)
✅ What makes your property unique?
```

### If RENT:
```
✅ Preferred Agreement Type (Company lease/Any)
✅ Rent Details
├─ Expected Rent
├─ Electricity & Water excluded (checkbox)
└─ Price Negotiable (checkbox)
✅ Security Deposit
├─ Deposit type (Fixed/Multiple of Rent/None)
├─ Deposit value
├─ Agreement Duration (6/11/12/24 months)
└─ Notice Period (1/2/3 months)
✅ What makes your property unique?
```

---

## STEP 6: Features & Amenities

### Residential Properties Show:
```
✅ Residential Section
├─ Facing (North/South/East/West/NE/NW/SE/SW)
├─ Overlooking
├─ RERA Registered
├─ RERA Number (if registered)
├─ Gated Community
├─ Power Backup (None/Partial/Full)
├─ Water Supply (Municipal/Borewell/Both)
├─ Corner Property
└─ Open Sides (1/2/3/4)

✅ Fire Safety
├─ Fire Extinguisher
├─ Fire Sensors
├─ Fire Sprinklers
└─ Fire Hose

✅ Amenities & Facilities
✅ Distance to Key Facilities
```

### Commercial Properties Show:
```
✅ Commercial Section
├─ Fire NOC Certified
├─ Retail Details (if retail)
├─ Occupancy Certificate
└─ Building Grade

✅ Fire Safety
├─ Fire Extinguisher
├─ Fire Sensors
└─ Fire Sprinklers

✅ Office Features (if office type)
✅ Other sections...
```

❌ Residential Section - HIDDEN for commercial

---

## NOW WITH PROPER 99ACRES FUNCTIONALITY ✅

**What Changed:**
1. ✅ **Category Selection Shows Up** - Click Residential or Commercial, see category cards
2. ✅ **Visual Icons & Cards** - Beautiful emoji icons for each category
3. ✅ **Dynamic Field Updates** - Categories with bedrooms show bedroom fields
4. ✅ **Smooth Animations** - All transitions use fadeIn/fadeOut
5. ✅ **Smart Visibility** - Plot/Land hides bedroom fields, Office shows office fields
6. ✅ **Just Like 99acres** - Professional property type handling

---

## How to Test

**Test Case 1:**
1. Select "Sale"
2. Select "Residential"
3. Click "Apartment"
4. ✅ Should see bedrooms/bathrooms/balconies

**Test Case 2:**
1. Select "Sale"
2. Select "Commercial"
3. Click "Office Space"
4. ✅ Should see office setup fields, NOT bedrooms

**Test Case 3:**
1. Select "Sale"
2. Select "Residential"
3. Click "Plot"
4. ✅ Should NOT see bedrooms (all hidden)

**Test Case 4:**
1. Select "Rent"
2. Select "Residential"
3. Click "Apartment"
4. ✅ Should see "Willing to rent to" section

---

## Files Updated

✅ `PropertyForm.php` - Updated category HTML structure
✅ `property-form-custom-v2.js` (public) - NEW with category population
✅ `property-form-custom-v2.js` (resources) - NEW source version

---

## Status: ✅ COMPLETE

Your property form now works exactly like 99acres.com!
